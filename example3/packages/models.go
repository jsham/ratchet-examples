package mypkg

type ReceivedData struct {
	ID    int    `json:"id,omitempty"`
	Name  string `json:"name,omitempty"`
	Email string `json:"email,omitempty"`
	Phone string `json:"phone,omitempty"`
	JobCd string `json:"job_cd",omitempty`
}

type TransformedData struct {
	KrewID   int    `json:"krew_id,omitempty"`
	KrewName string `json:"krew_name,omitempty"`
	Email    string `json:"email,omitempty"`
	Mobile   string `json:"mobile,omitempty"`
	JobCode  string `json:"job_code,omitempty"`
}
