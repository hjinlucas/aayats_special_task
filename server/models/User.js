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
        avatar:{type: String, required: true, default: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fin.pinterest.com%2Fpin%2Fuser-pictures-by-anna-litviniuk--536702480572227623%2F&psig=AOvVaw18GFaDcplLUugSh3Rsdbx0&ust=1701453122699000&source=images&cd=vfe&ved=0CBIQjRxqFwoTCIDv3vmk7IIDFQAAAAAdAAAAABAE"},
    },  {timestamps: true}
)

module.exports = mongoose.model("User", UserSchema)