package entity

type C_designation struct{
	Id_designation     	int    `json:"id_designation";gorm:"primaryKey"`
	Id_department      	int    `json:"id_department"`
	Name	  			string `json:"name"`
	Status_active  		int    `json:"status_active"`
	Creator	  			int    `json:"creator"`
	Last_updater   		int    `json:"last_updater"`
	Created_date	 	string `json:"created_date"`
	Last_updated   		string `json:"last_updated"`
}