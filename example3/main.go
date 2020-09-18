package main

import (
	"database/sql"

	"github.com/dailyburn/ratchet"
	"github.com/dailyburn/ratchet/logger"
	"github.com/dailyburn/ratchet/processors"
	_ "github.com/go-sql-driver/mysql"
	mypkg "github.com/ratchet-examples/example3/packages"
)

// Uses a branching pipeline
func main() {
	inputDB := setupDB("mysql", "root:root123@tcp(127.0.0.1:13306)/srcDB")
	extractDP := processors.NewSQLReader(inputDB, mypkg.Query(0))

	transformDP := mypkg.NewMyTransformer()

	outputDB := setupDB("mysql", "root:root123@tcp(127.0.0.1:13306)/dstDB")
	outputTable := "krew_info"
	loadDP := processors.NewSQLWriter(outputDB, outputTable)

	// Simple example of how to start a Branching Pipeline.
	// Currently does the same thing as example2's non-branching pipeline
	// but you can optionally add more DataProcessors to each stage. See
	// example4 for a more serious usage.
	layout, err := ratchet.NewPipelineLayout(
		ratchet.NewPipelineStage( // Stage 1
			ratchet.Do(extractDP).Outputs(transformDP),
		),
		ratchet.NewPipelineStage( // Stage 2
			ratchet.Do(transformDP).Outputs(loadDP),
		),
		ratchet.NewPipelineStage( // Stage 3
			ratchet.Do(loadDP),
		),
	)

	pipeline := ratchet.NewBranchingPipeline(layout)
	pipeline.Name = "My Pipeline"

	err = <-pipeline.Run()
	if err != nil {
		logger.ErrorWithoutTrace(pipeline.Name, ":", err)
		logger.ErrorWithoutTrace(pipeline.Stats())
	} else {
		logger.Info(pipeline.Name, ": Completed successfully.")
	}
}

func setupDB(driver, conn string) *sql.DB {
	db, err := sql.Open(driver, conn)
	if err != nil {
		logger.Error(err)
		panic(err)
	}
	return db
}
