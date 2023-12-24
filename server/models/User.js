const mongoose = require("mongoose");

const UserSchema = new mongoose.Schema(
    {
        username:{type: String, required: true, unique: true},
        email:{type: String, requirde: true, unique: true},
        password:{type: String, required: true},
        location:{type: String, required: false},
        isCertified:{type: Boolean, default: false},//Certified user can have certification label
        isAgent:{type: Boolean, default: false},//Agent user can upload their studios for rent
        description:{type: String, require:true, default:"One line of words is not enough to describe my work"},
        avatar:{type: String, required: true, default: "https://via.placeholder.com/150"},
    },  {timestamps: true}
)

module.exports = mongoose.model("User", UserSchema)
