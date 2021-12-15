module.exports = {
    user : process.env.NODEORACLEDB_USER || "mohang",
    password : process.env.NODEORACLEDB_PASSWORD || '1234',
    connectString : process.env.NODE_ORACLEDB_CONNECTIONSTRING || 'localhost:1521/xe'
}