const db = require('../data/config')


//Get all Schemes
function find(){
    return db("schemes")
}

//Get scheme by Id
function findById(id){
   return db("schemes").where({id}).first();
}

//Get Steps by Id
function findSteps(id){
    return db("schemes as s")
        .where({scheme_id: id})
        .join("steps as st", "s.id", "st.scheme_id")
        .select("s.id", "s.scheme_name", "st.step_number", "st.instructions")
        .orderBy("st.step_number", "desc")
}

//Add a Scheme
function add(schemeData){
    return db("schemes").insert(schemeData)
}
//Add a step
function addStep(stepData, id) {
    db("steps").insert(stepData)
    return db("steps").where()
}
//update a scheme
function update(changes, id){
    return db("schemes").where({id: id}).update(changes)
}
//Remove a scheme
function remove(id){
    return db("schemes").where({id: id}).del()
}



module.exports ={
    find,
    findById,
    findSteps,
    add,
    addStep,
    update,
    remove
}