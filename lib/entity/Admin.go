package entity

type C_admins struct{
	Id_admin	      	int    `json:"id_admin";gorm:"primaryKey"`
	Email	  			string `json:"email"`
	Password  			string `json:"password"`
	Avatar	  			string `json:"avatar"`
	Name	  			string `json:"name"`
	Phone	  			string `json:"phone"`
	Address	  			string `json:"address"`
	Born_place 			string `json:"born_place"`
	Gender	 			int	   `json:"gender"`
	Status_active  		int    `json:"status_active"`
	Creator	  			int    `json:"creator"`
	Last_updater   		int    `json:"last_updater"`
	Created_date	 	string `json:"created_date"`
	Last_updated_date	string `json:"last_updated"`
}