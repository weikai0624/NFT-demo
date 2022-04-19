# NFT-demo

## How to Depoly
 
### IPFS 
1. Open https://www.pinata.cloud/ to register 
2. "upload folder" select [ipfs/meta_images](ipfs/meta_images)
3. copy step2 CID to [ipfs/meta_json](ipfs/meta_json) all json
4. "upload folder" select [ipfs/meta_jsons](ipfs/meta_jsons)
5. keep step 4 CID

### Remix 
1. Go https://remix.ethereum.org/ to depoly
2. clone from this projects
3. DEPLOY & RUN TRANSACTIONS -> environment "Injected Web3"
4. Connect Rinkeby network (testnet) Account 
5. select "CONCRACT" WeikaiMeta - contracts
6. setting variable "initBaseURL" = { [ipfs/meta_jsons](ipfs/meta_jsons) CID in ipfs} 
7. Depoly

### Mint
1. input "VALUE" = 10000000 Gwei
2. Find "mintWeikaiNTF" and input mint quantity -> tcransact
3. Open https://testnets.opensea.io/ to check yout NTF!!