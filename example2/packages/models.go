package mypkg

type ReceivedData struct {
	ID    int    `json:"id,omitempty"`
	Name  string `json:"name"`
	Email string `json:"email"`
	Phone string `json:"phone"`
	JobCd string `json:"job_cd`
}

type TransformedData struct {
	KrewID   int    `json:"krew_id,omitempty"`
	KrewName string `json:"krew_name"`
	Email    string `json:"eamil"`
	Mobile   string `json:"jmobile"`
	JobCode  string `json:"job_code"`
}
