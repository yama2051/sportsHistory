package com.example.sportsHistry.model;

public class SportsNameEntity {
	
    private Long id;
    private String name;
    private String pathUrl; 
    private boolean highlight; // ★ ここを 'highlight' に修正
    private String comment;
    
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPathUrl() {
        return pathUrl;
    }

    public void setPathUrl(String pathUrl) {
        this.pathUrl = pathUrl;
    }

    // ★ ここを isHighlight() に修正
    public boolean isHighlight() {
		return highlight;
	}

    // ★ ここを setHighlight() に修正
	public void setHighlight(boolean highlight) {
		this.highlight = highlight;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	@Override
    public String toString() {
        return "Sport{" +
               "id=" + id +
               ", name='" + name + '\'' +
               ", pathUrl='" + pathUrl + '\'' +
               ", highlight=" + highlight + // toStringも修正するとデバッグ時に便利
               ", comment='" + comment + '\'' +
               '}';
    }
}