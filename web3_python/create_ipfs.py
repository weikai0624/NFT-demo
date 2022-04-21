from asyncore import read
from distutils.command.config import config
import os
import json
from textwrap import indent

def read_json(path):
    with open(path,"r") as f:
        return json.load(f)

def write_json(json_data, path):
    with open(path, "w") as f:
        json.dump(json_data,f)

def change_jsons_cid(mintIndex,index_json_data,images_cid):
    image=f"ipfs://{images_cid}/{mintIndex}.PNG"
    index_json_data['image']=image
    return index_json_data

def main():
    config=read_json('./config.json')
    IPFS_IMAGES_CID=config['IPFS_IMAGES_CID']
    for i in range(10):
        mintIndex = i+1
        print(mintIndex)
        json_path = '../ipfs/meta_jsons/%s.json' %mintIndex
        index_json_data=read_json(json_path)
        change_json_data=change_jsons_cid(mintIndex,index_json_data,IPFS_IMAGES_CID)
        print(change_json_data)
        write_json(change_json_data,json_path)
    print('Success change CID in ipfs/meta_jsons')

if __name__ == "__main__":
    main()