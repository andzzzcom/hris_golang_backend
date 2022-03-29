package controllers

import(
	"fmt"
	"net/http"
    "io/ioutil"
	"encoding/json"
	"github.com/gorilla/mux"
	database "hris_backend_golang/lib/db"
	entity "hris_backend_golang/lib/entity"
)

func AdminLogin(w http.ResponseWriter, r *http.Request){
	db			:= database.ConnectDB()
	

	type Rt struct{
		Email string `json: "email"`
		Password string `json:"password"`
	}

    body, err := ioutil.ReadAll(r.Body)
    var t Rt
    err = json.Unmarshal(body, &t)
    if err != nil {
        panic(err)
    }
	
	fmt.Println(t.Email)
	fmt.Println(t.Password)

	admin		:= db.Where("email=?", t.Email).Find(&[]entity.C_admins{})

	a, _ := json.Marshal(admin)
	fmt.Println(string(a))
}

func GetAllAdmin(w http.ResponseWriter, r *http.Request){
	db 		 	:= database.ConnectDB()

	admins		:= db.Where("status_active != ?", -1).Order("id_admin desc").Find(&[]entity.C_admins{})
	result	  	:= entity.Response{
		"success",
		200,
		admins,
	}
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(&result)
}

func GetAdminById(w http.ResponseWriter, r *http.Request){
	db			:= database.ConnectDB()

	id	 		:= mux.Vars(r)["id"]
	admin		:= db.Where("id_admin=?", id).Find(&[]entity.C_admins{})
	result		:= entity.Response{
		"success",
		200,
		admin,
	}
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(&result)

}

func CreateNewAdmin(w http.ResponseWriter, r *http.Request){
	db			:= database.ConnectDB()
	
    decoder 	:= json.NewDecoder(r.Body)
	fmt.Println(r.Body)

	var adm entity.C_admins
    err := decoder.Decode(&adm)
    if err != nil {
        panic(err)
    }
	fmt.Println(adm)
    db.Create(&adm) 
}

func UpdateNewAdmin(w http.ResponseWriter, r *http.Request){
	db			:= database.ConnectDB()
	
	var adm entity.C_admins
    json.NewDecoder(r.Body).Decode(&adm)
	
    db.Model(&entity.C_admins{}).Where("id_admin=?", adm.Id_admin).Updates(adm)

    w.Header().Set("Content-Type", "application/json")
    json.NewEncoder(w).Encode(adm)
}

func RemoveNewAdmin(w http.ResponseWriter, r *http.Request){
	db			:= database.ConnectDB()
	
	var adm entity.C_admins
    json.NewDecoder(r.Body).Decode(&adm)
	
    db.Model(&entity.C_admins{}).Where("id_admin=?", adm.Id_admin).Update(adm)

    w.Header().Set("Content-Type", "application/json")
    json.NewEncoder(w).Encode(adm)
}