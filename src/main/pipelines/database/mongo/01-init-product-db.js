db = db.getSiblingDB('admin');

db.createUser({
    user: 'mlisena',
    pwd: 'A8424628',
    roles: [
        { role: 'readWrite', db: 'product_db' }
    ]
});

db = db.getSiblingDB('product_db');

db.createCollection('products');