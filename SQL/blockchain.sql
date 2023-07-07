use this_schema; 

-- NOT NULL check 
select count(*), count(id), count(network), count(collection_id), count(account), count(balance), count(token_id), count(block_number)
from this_table
;


