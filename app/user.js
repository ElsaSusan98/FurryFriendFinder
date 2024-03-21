const pool = require('./services/db');
//const bcrypt = require('bcrypt');


function User() {};

User.prototype = {
    // Find the user data by id or username.
    find : function(user = null, callback)
    {
        // if the user variable is defind
        if(user) {
            // if user = number return field = id, if user = string return field = username.
            var field = Number.isInteger(user) ? 'id' : 'user_name';
        }
        // prepare the sql query
        let sql = `SELECT * FROM user_table WHERE ${field} = ?`;


        pool.query(sql, user, function(err, result) {
            if(err) throw err

            if(result.length) {
                callback(result[0]);
            }else {
                callback(null);
            }
        });
    },

    // This function will insert data into the database. (create a new user)
    // body is an object 
    // create : function(body, callback) 
    // {

    //     var pwd = body.password;
    //     // Hash the password before insert it into the database.
    //     body.password = bcrypt.hashSync(pwd,10);

    //     // this array will contain the values of the fields.
    //     var bind = [];
    //     // loop in the attributes of the object and push the values into the bind array.
    //     for(prop in body){
    //         bind.push(body[prop]);
    //     }
    //     // prepare the sql query
    //     let sql = `INSERT INTO user_table(user_name, user_email, user_password) VALUES (?, ?, ?)`;
    //     // call the query give it the sql string and the values (bind array)
    //     pool.query(sql, bind, function(err, result) {
    //         if(err) throw err;
    //         // return the last inserted id. if there is no error
    //         callback(result.insertId);
    //     });
    // },

    login: function(username, password, callback) {
        // Prepare the SQL query to find the user by username and password.
        let sql = `SELECT * FROM user_table WHERE user_name = ? AND user_password = ?`;

        // Execute the query with the provided username and password.
        pool.query(sql, [username, password], function(err, result) {
            if (err) {
                throw err;
            }

            // If a user with the given username and password is found.
            if (result.length > 0) {
                const user = result[0];
                callback(user); // Pass user data to the callback function
            } else {
                // If no user with the given username and password is found, return null.
                callback(null);
            }
        });
    
    
    },
    

}

module.exports = User;