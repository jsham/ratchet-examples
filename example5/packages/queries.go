package mypkg

import (
	"fmt"
	"strings"

	"github.com/dailyburn/ratchet/data"
	"github.com/dailyburn/ratchet/logger"
)

// Filter out users with IDs less than 400
func Query1() string {
	queryStr := fmt.Sprintf(`SELECT id, name FROM users WHERE id >= 400`)
	return queryStr
}

// Get the cities for just the UserIDs we received from previous stage
func Query2(usersJSON data.JSON) (string, error) {
	userIDs, err := userIDsFromJSON(usersJSON)
	if err != nil {
		panic(err)
	}

	sql := fmt.Sprintf(` SELECT id, city FROM addresses WHERE `)
	sql += fmt.Sprintf("id IN (%v)", strings.Join(userIDs, ","))
	logger.Info("sql: ", sql)

	return sql, nil
}

func userIDsFromJSON(usersJSON data.JSON) ([]string, error) {
	users := []UserID{}
	err := data.ParseJSON(usersJSON, &users)
	if err != nil {
		return nil, err
	}

	userIDs := []string{}
	for _, user := range users {
		userIDs = append(userIDs, fmt.Sprintf("%v", user.UserID))
	}

	return userIDs, nil
}
