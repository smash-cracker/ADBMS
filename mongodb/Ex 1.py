from pymongo import MongoClient
client = MongoClient('localhost', 27017)
mydatabase = client.college1
collection = mydatabase.studlist1

# 1
result = collection.find({"course":"MCA", "gender":"female"}, {"name.fname":1, "name.lname":1,"mark":1, "_id":0 })
for x in result:
    print(x)

# 2
print(collection.find_one({"course":"MCA"},{"name.fname":1},sort=[("mark", -1)]))


# 3
result = collection.find({"gender":"male", "grade":"A+"},{})
for x in result:
    print(x)

# 4
results = collection.find({"course":"Mechanical"},{"name.fname":1},sort=[("mark", -1)],limit=3)
for x in results:
    print(x)

# 5
results = collection.find({"gender":"female","mark":{"$gt":90}},{"name.fname":1,"name.lname":1,"grade":1,"mark":1,"phone.no":1})
for x in results:
    print(x)

# 6
results = collection.find({"mark":{"$lt":90, "$gt":80}},{"name.fname":1,"name.lname":1,"grade":1,"mark":1,"phone.no":1})
for x in results:
    print(x)

# 7
results = collection.find({"name.fname":{"$regex":"^V"}},{"name":1})
for x in results:
    print(x)

# 8
results = collection.find({"address.city":"Kollam"},{"name":1})
for x in results:
    print(x)

# 9
results = collection.find({"$nor": [{"address.city": {"$in":["Thiruvananthapuram","Kollam"]}}]})
for x in results:
    print(x)

# 10    
results = collection.find({"gender":"female","address.city":{"$in":["Thiruvananthapuram","Kollam"]}})
for x in results:
    print(x)
