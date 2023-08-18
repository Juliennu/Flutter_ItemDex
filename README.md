# item_dex

This is searching products app which uses [Yahoo Japan shopping API](https://developer.yahoo.co.jp/webapi/shopping/shopping/v3/itemsearch.html).

## Set up
### 1. Create Cliant ID
- Create Cliant ID of Yahoo API from the link below.<br>
https://e.developer.yahoo.co.jp/register 
- Copy your Cliant ID.

### 2. Create `.env` file
- Create a `.env` file under the "item_dex" project folder. 
- Write the Cliant ID in the `.env` file as follows.
    ```
    YAHOO_API_APP_ID=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    ```
    (Paste the Cliant ID you have just created in the "xxxx" field.)
