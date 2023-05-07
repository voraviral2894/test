# Songs app - API

# run command to install node packages

npm i

# start project

npm start

# once project will be started, you can access APIs using nelow endpoint

http://localhost:3000/

# Notes about created app, database & APIs:

- I have created this app using Node.JS and Express.JS.

- For database, I have used mysql and added database script in seperate folder named `Database script` in this repo.
- In the database, there are 3 tables as below:

1. s001_categories - For song categories
2. s002_artists - To save list of artists
3. s003_songs - To save list of songs

- There are total 4 APIs developed as below:

1. To get list of random songs by page number:

- There is `page` query parameter using for fetching page wise data. For example, if page number is 1 then it will fetch first 10 records to show in page 1. Then for next page 2, it will fetch next 10 records. I have implemented this page concept for pagination wise show data in the app.

2. To get song details by song id

3. To update song details by song id

4. To delete song by song id

- For testing all above APIs, I have created postman collection with all 4 requests and attached that collection in this repo folder called `Postman collection`.
