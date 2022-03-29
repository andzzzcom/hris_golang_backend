package controllers

import(
	"fmt"
	"net/http"
	"encoding/json"
	"github.com/gorilla/mux"
	database "hris_backend_golang/lib/db"
	entity "hris_backend_golang/lib/entity"
)

func GetAllDepartment(w http.ResponseWriter, r *http.Request){
	db 		 	:= database.ConnectDB()

	department  := db.Where("status_active != ?", -1).Order("id_department desc").Find(&[]entity.C_department{})
	result	  := entity.Response{
		"success",
		200,
		department,
	}
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(&result)
}

func GetDepartmentById(w http.ResponseWriter, r *http.Request){
	db			:= database.ConnectDB()

	id	 		:= mux.Vars(r)["id"]
	department	:= db.Where("id_department=?", id).Find(&[]entity.C_department{})
	result		:= entity.Response{
		"success",
		200,
		department,
	}
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(&result)

}

func CreateNewDepartment(w http.ResponseWriter, r *http.Request){
	db			:= database.ConnectDB()
	
    decoder 	:= json.NewDecoder(r.Body)
	fmt.Println(r.Body)

	var dep entity.C_department
    err := decoder.Decode(&dep)
    if err != nil {
        panic(err)
    }
	fmt.Println(dep)
    db.Create(&dep) 
}

func UpdateNewDepartment(w http.ResponseWriter, r *http.Request){
	db			:= database.ConnectDB()
	
	var dep entity.C_department
    json.NewDecoder(r.Body).Decode(&dep)
	
    db.Model(&entity.C_department{}).Where("id_department=?", dep.Id_department).Updates(dep)

    w.Header().Set("Content-Type", "application/json")
    json.NewEncoder(w).Encode(dep)
}

func RemoveNewDepartment(w http.ResponseWriter, r *http.Request){
	db			:= database.ConnectDB()
	
	var dep entity.C_department
    json.NewDecoder(r.Body).Decode(&dep)
	
    db.Model(&entity.C_department{}).Where("id_department=?", dep.Id_department).Update(dep)

    w.Header().Set("Content-Type", "application/json")
    json.NewEncoder(w).Encode(dep)
}