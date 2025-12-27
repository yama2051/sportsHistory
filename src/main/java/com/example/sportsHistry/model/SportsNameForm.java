package com.example.sportsHistry.model;

import lombok.Data;

@Data
public class SportsNameForm {
	private String sportName;

    // Lombokを使用しない場合は、手動でgetterとsetterを記述します
    public String getSportName() {
        return sportName;
    }

    public void setSportName(String sportName) {
        this.sportName = sportName;
    }

    @Override
    public String toString() {
        return "SportSearchForm [sportName=" + sportName + "]";
    }
}
