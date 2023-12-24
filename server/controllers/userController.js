const User = require("../models/User");
const CryptoJS = require("crypto-js");

module.exports = {
    updateUser: async (req, res) => {
        if(req.body.password){
            req.body.password = CryptoJS.AES.encrypt(req.body.password, process.env.SECRET).toString();
        }

        try{
            const updatedUser = await User.findByIdAndUpdate(
                req.params.id,
                { $set: req.body },
                { new: true }
            );

            // Ensure the updatedUser is not null
            if (!updatedUser) {
                return res.status(404).json({ message: "User not found." });
            }
        
            const { password, __v, createdAt, updatedAt, ...others } = updatedUser._doc;
            res.status(200).json(others);
        } catch(error){
            res.status(500).json({ message: error.message });
        }
    },

    deleteUser: async (req, res) => {
        try{
            await User.findByIdAndDelete(req.params.id)
            res.status(200).json("Account Has Been Successfully Deleted")
        }catch(erorr){
            res.status(500).json(error)
        }
    },

    getUser: async (req, res) => {
        try {
            const user = await User.findById(req.user.id);
            const { password, __v, createdAt, ...userdata } = user._doc;
            res.status(200).json(userdata)
        } catch (error) {
            res.status(500).json(error)
        }
    },


    getAllUsers: async (req, res) => {
        try {
            const allUser = await User.find();

            res.status(200).json(allUser)
        } catch (error) {
            res.status(500).json(error)
        }
    },

};

