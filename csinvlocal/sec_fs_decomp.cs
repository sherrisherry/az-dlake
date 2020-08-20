using System;
using System.IO;
using System.IO.Compression;
using System.Linq;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using Microsoft.Azure.WebJobs;
using Microsoft.Extensions.Logging;
using Microsoft.WindowsAzure.Storage;
using Microsoft.WindowsAzure.Storage.Blob;

// envars: sourcepool, cachepool

namespace SEC.ETL
{
    public static class sec_fs_decomp
    {
        [FunctionName("sec_fs_decomp")]
        public static async Task Run([BlobTrigger("sec-fs/{fpath}", Connection = "sourcepool")]CloudBlockBlob myBlob, string fpath, ILogger log)
        {
            log.LogInformation($"C# Blob trigger function Processed blob\n Name:{fpath}");
            
            string destinationStorage = Environment.GetEnvironmentVariable("cachepool");
            string destinationContainer = "cache-sec-fs";
            //string destinationContainer = Environment.GetEnvironmentVariable("destinationContainer");

            try{
                if(fpath.Split('.').Last().ToLower() == "zip"){

                    //fpath = fpath.Split('/').First();

                    CloudStorageAccount storageAccount = CloudStorageAccount.Parse(destinationStorage);
                    CloudBlobClient blobClient = storageAccount.CreateCloudBlobClient();
                    CloudBlobContainer container = blobClient.GetContainerReference(destinationContainer);
                    
                    using(MemoryStream blobMemStream = new MemoryStream()){

                        await myBlob.DownloadToStreamAsync(blobMemStream);

                        using(ZipArchive archive = new ZipArchive(blobMemStream))
                        {
                            foreach (ZipArchiveEntry entry in archive.Entries)
                            {
                                if(entry.Name.Split('.').Last().ToLower() == "tsv"){
                                    log.LogInformation($"Now processing {entry.FullName}");
                                    //Replace all NO digits, letters, or "-" by a "-" Azure storage is specific on valid characters
                                    //string valideName = Regex.Replace(entry.Name,@"[^a-zA-Z0-9\-]","-").ToLower();
                                    string valideName = $"{fpath}/{entry.Name}";
                                    
                                    CloudBlockBlob blockBlob = container.GetBlockBlobReference(valideName);
                                    using (var fileStream = entry.Open()){
                                        await blockBlob.UploadFromStreamAsync(fileStream);
                                        }
                                }else{
                                    log.LogInformation($"Skipped {entry.FullName}");
                                }
                            }
                        }
                    }
                }
            }
            catch(Exception ex){
                log.LogInformation($"Error! Something went wrong: {ex.Message}");

            }
        }
    }
}
