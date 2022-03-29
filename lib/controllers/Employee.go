package controllers

import(
	"fmt"
	"net/http"
	"encoding/json"
	"github.com/gorilla/mux"
	database "hris_backend_golang/lib/db"
	entity "hris_backend_golang/lib/entity"

)

func GetAllEmployees(w http.ResponseWriter, r *http.Request){
	db 		  := database.ConnectDB()

	employees := db.Where("status_active != ?", -1).Order("id_employee desc").Find(&[]entity.C_employee{})
	result	  := entity.Response{
		"success",
		200,
		employees,
	}
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(&result)
}

func GetEmployeeById(w http.ResponseWriter, r *http.Request){
	db			:= database.ConnectDB()

	id	 		:= mux.Vars(r)["id"]
	employee	:= db.Where("id_employee=?", id).Find(&[]entity.C_employee{})
	result		:= entity.Response{
		"success",
		200,
		employee,
	}
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(&result)

}

func CreateNewEmployee(w http.ResponseWriter, r *http.Request){
	db			:= database.ConnectDB()
	
    decoder 	:= json.NewDecoder(r.Body)
	fmt.Println(r.Body)

	var emp entity.C_employee
    err := decoder.Decode(&emp)
    if err != nil {
        panic(err)
    }
	fmt.Println(emp)
    db.Create(&emp) 
}

func UpdateNewEmployee(w http.ResponseWriter, r *http.Request){
	db			:= database.ConnectDB()
	
	var emp entity.C_employee
    json.NewDecoder(r.Body).Decode(&emp)
	
    db.Model(&entity.C_employee{}).Where("id_employee=?", emp.Id_employee).Updates(emp)

    w.Header().Set("Content-Type", "application/json")
    json.NewEncoder(w).Encode(emp)
}

func RemoveNewEmployee(w http.ResponseWriter, r *http.Request){
	db			:= database.ConnectDB()
	
	var emp entity.C_employee
    json.NewDecoder(r.Body).Decode(&emp)
	
    db.Model(&entity.C_employee{}).Where("id_employee=?", emp.Id_employee).Update(emp)

    w.Header().Set("Content-Type", "application/json")
    json.NewEncoder(w).Encode(emp)
}