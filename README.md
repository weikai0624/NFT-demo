# NFT-demo

## How to Depoly

### Remix 
1. Go https://remix.ethereum.org/ to depoly
2. clone from this projects
3. DEPLOY & RUN TRANSACTIONS -> environment "Injected Web3"
4. Connect Rinkeby network (testnet) Account 
5. select "CONCRACT" WeikaiMeta - contracts
6. setting variable "initBaseURL" = { [ipfs/meta_jsons](ipfs/meta_jsons) CID in ipfs} 
7. Depoly

### IPFS 
1. Open https://www.pinata.cloud/ to register 
2. "upload folder" select [ipfs/meta_images](ipfs/meta_images)
3. copy step2 CID to [web3_python/condig.json](web3_python/condif.json) "IPFS_IMAGES_CID"
4. excute Script 

    ```python create_ipfs.py```

    create [ipfs/meta_jsons](ipfs/meta_jsons)
5. "upload folder" select [ipfs/meta_jsons](ipfs/meta_jsons)
6. setting variable "initBaseURL" = { [ipfs/meta_jsons](ipfs/meta_jsons) CID in ipfs} in [Remix step 6](#Remix)

### Mint
1. setting [web3_python/config.json](web3_python/config.json)

    ``` python mint.py```
2. Successful Mint!!