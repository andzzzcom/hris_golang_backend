package controllers

import(
	"fmt"
	"net/http"
	"encoding/json"
	"github.com/gorilla/mux"
	database "hris_backend_golang/lib/db"
	entity "hris_backend_golang/lib/entity"

)

func GetAllDesignation(w http.ResponseWriter, r *http.Request){
	db 		 	:= database.ConnectDB()

	designation := db.Where("status_active != ?", -1).Order("id_designation desc").Find(&[]entity.C_designation{})
	result	  := entity.Response{
		"success",
		200,
		designation,
	}
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(&result)
}

func GetDesignationById(w http.ResponseWriter, r *http.Request){
	db			:= database.ConnectDB()

	id	 		:= mux.Vars(r)["id"]
	designation	:= db.Where("id_designation=?", id).Find(&[]entity.C_designation{})
	result		:= entity.Response{
		"success",
		200,
		designation,
	}
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(&result)

}

func CreateNewDesignation(w http.ResponseWriter, r *http.Request){
	db			:= database.ConnectDB()
	
    decoder 	:= json.NewDecoder(r.Body)
	fmt.Println(r.Body)

	var des entity.C_designation
    err := decoder.Decode(&des)
    if err != nil {
        panic(err)
    }
	fmt.Println(des)
    db.Create(&des) 
}

func UpdateNewDesignation(w http.ResponseWriter, r *http.Request){
	db			:= database.ConnectDB()
	
	var des entity.C_designation
    json.NewDecoder(r.Body).Decode(&des)
	
    db.Model(&entity.C_designation{}).Where("id_designation=?", des.Id_designation).Updates(des)

    w.Header().Set("Content-Type", "application/json")
    json.NewEncoder(w).Encode(des)
}

func RemoveNewDesignation(w http.ResponseWriter, r *http.Request){
	db			:= database.ConnectDB()
	
	var des entity.C_designation
    json.NewDecoder(r.Body).Decode(&des)
	
    db.Model(&entity.C_designation{}).Where("id_designation=?", des.Id_designation).Update(des)

    w.Header().Set("Content-Type", "application/json")
    json.NewEncoder(w).Encode(des)
}