const express = require('express');
const app = express();
const dotenv = require('dotenv');
const mongoose = require('mongoose');

const authRoute = require("./routes/auth");
const userRoute = require("./routes/user");
const chatRoute = require('./routes/chat');
const messageRoute = require('./routes/messages');

dotenv.config();

mongoose.connect(process.env.MONGO_URL).then(()=>console.log('db connected')).catch((err)=>{console.log(err)});


app.use(express.json());
app.use("/api", authRoute);
app.use("/api/users", userRoute);
app.use('/api/chats', chatRoute);
app.use('/api/messages', messageRoute);
  

const port = process.env.PORT || 5002;
const server = app.listen(port, () => console.log(`Aayats listening on port ${port}!`));

const io = require('socket.io')(server, {
    pingTimeout: 60000,
    cors: {
        // localhost
        origin: "http://localhost:5001/"
        // hosted server
        // 
    }
});

io.on("connection", (socket) => {
    console.log("connected to sockets");

    socket.on('setup', (userId) => {
        socket.join(userId);
        socket.broadcast.emit('online-user', userId)
        console.log(userId);
    });


    socket.on('typing', (room) => {
        // console.log("typing");
        // console.log("room");
        socket.to(room).emit('typing', room)
    });


    socket.on('stop typing', (room) => {
        // console.log("stop typing");
        // console.log("room");
        socket.to(room).emit('stop typing', room)
    });


    socket.on('join chat', (room) => {
        socket.join(room)
        // console.log('User Joined : ' + room);
    });

    socket.on('new message', (newMessageReceived) => {

        var chat = newMessageReceived.chat;
        var room = chat._id;

        var sender = newMessageReceived.sender;

        if (!sender || sender._id) {
            // console.log('Sender not defined');
            return;
        }

        var senderId = sender._id;
        // console.log(senderId + "message sender");
        const users = chat.users;

        if (!users) {
            // console.log(" Users not defined");
            return;
        }

        socket.to(room).emit('message received', newMessageReceived);
        socket.to(room).emit('message sent', "New Message");
    });


    socket.off('setup', () => {
        // console.log('user offline');
        socket.leave(userId)
    })


})