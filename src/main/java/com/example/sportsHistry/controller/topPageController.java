package com.example.sportsHistry.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import com.example.sportsHistry.model.PageUrlEntity;
import com.example.sportsHistry.model.SportsNameDTO;
import com.example.sportsHistry.model.SportsNameForm;
import com.example.sportsHistry.model.TimeLineEvent;
import com.example.sportsHistry.service.SportsNameService;
import com.example.sportsHistry.service.TimeLineService;

@Controller
public class topPageController {
	//private static final Logger logger = LoggerFactory.getLogger(topPageController.class);

	
	@Autowired
	private TimeLineService timeLineService;
	
	@Autowired
	private SportsNameService sportsNameService;

	
	//topPageを開く
	@SuppressWarnings("null")
	@GetMapping("/")
	public String showTopPage(Model model, @ModelAttribute SportsNameForm sportsNameForm) {
		SportsNameDTO sportsNameDto = sportsNameService.todaysSports();
		model.addAttribute("todaysSports", sportsNameDto); 
	    return "topPage"; 
	}
	
	//検索ボックスによる検索
	@GetMapping("/search")
	public String searchTopPage(@ModelAttribute SportsNameForm sportsNameForm) {
		String sportsName =sportsNameForm.getSportName();
		SportsNameDTO sportsNameDto = sportsNameService.findSportsUrl(sportsName);
		
		if(sportsNameDto != null && sportsNameDto.getPathUrl() != null) {
			String path = sportsNameDto.getPathUrl();
			return "redirect:" + path;
		} else {
			//エラー発生時
			return "errorPage";
		}
	}
	
	//初期表示で日本の年表を表示
	@GetMapping("/detail/{sportsCode}")
	public String showBaseballDetail(@PathVariable String sportsCode,String country, Model model) {
		//defaule japan
		//初期表示で日本の年表を表示する
		String defaultCountry ="japan";
		String dbSportsName = convertSportsCodeToDbSportsName(sportsCode);
		
		
		 // 年表データ取得
        List<TimeLineEvent> timeline = timeLineService.getByCountryAndSports(defaultCountry, dbSportsName);

        model.addAttribute("events", timeline);
        model.addAttribute("country", defaultCountry);
        model.addAttribute("sportsName", dbSportsName); 
        
        //参照ページ用
        List<PageUrlEntity> pageUrlDto = timeLineService.getReferencePage(sportsCode,defaultCountry);
        
        model.addAttribute("pageUrlList",pageUrlDto);
        
        if(dbSportsName == null || dbSportsName.isEmpty()) {
            //error
            return "errorPage"; 
        }else {
        	return "sportsDetail";
        }
		
	}
	
	 @GetMapping("/detail/{sportsCode}/{countryCode}") // URLにはsportsCodeとcountryCodeの両方
	    public String showDetailByCountry(@PathVariable String sportsCode, @PathVariable String countryCode, Model model) {
	        String dbSportsName = convertSportsCodeToDbSportsName(sportsCode);
	        String dbCountryName = convertCountryCodeToDbCountryName(countryCode); // 国コード変換メソッドを呼び出し

	        String defaultCountry = "japan";
	        // 未知のスポーツコードまたは国コードの場合のハンドリング
	        if (dbSportsName == null || dbCountryName == null) {
	            return "redirect:/"; // トップページへリダイレクト
	        }
	        
	     // ★ ここを追加：国コードに基づいた参照ページを取得
	        List<PageUrlEntity> pageUrlDto = timeLineService.getReferencePage(sportsCode, dbCountryName);
	        model.addAttribute("pageUrlList", pageUrlDto);
	        model.addAttribute("sportsCode", sportsCode);

	        // 年表データ取得
	        List<TimeLineEvent> timeline = timeLineService.getByCountryAndSports(dbCountryName, dbSportsName);

	        model.addAttribute("events", timeline);
	        model.addAttribute("country", dbCountryName); // JSPにDBの国名を渡す
	        model.addAttribute("sportsName", dbSportsName); // JSPにDBのスポーツ名を渡す
	        
	        if(dbSportsName == null || dbSportsName.isEmpty()) {
	            //error
	            return "errorPage"; 
	        }else {
	        	return "sportsDetail";
	        }
	    }
	
    /**
     * URLのスポーツコードをデータベースのsportsカラムの値に変換する補助メソッド。
     * 例: "baseball" -> "野球", "soccer" -> "サッカー"
     * @param sportsCode URLから取得したスポーツの識別子（例: "baseball"）
     * @return データベースに登録されているスポーツ名（例: "野球"）、またはnull（変換できない場合）
     */
    private String convertSportsCodeToDbSportsName(String sportsCode) {
        switch (sportsCode) {
            case "baseball":
                return "野球"; 
            case "soccer":
                return "サッカー"; 
            case "judo":
                return "柔道";
            case "basketball":
                return "バスケットボール"; 
            case "swwiming":
                return "水泳";
            case "kendo":
                return "剣道";
            case "wrestling":
                return "レスリング";
            default:
                return null; // 未知のスポーツコード
        }
    }
    
    /**
     * URLの国コードをデータベースのcountryカラムの値に変換する補助メソッド。
     * 例: "Japan" -> "Japan", "USA" -> "United States"
     * @param countryCode URLから取得した国の識別子（例: "Japan", "USA"）
     * @return データベースに登録されている国名（例: "Japan", "United States"）、またはnull（変換できない場合）
     */
    private String convertCountryCodeToDbCountryName(String countryCode) {
        switch (countryCode.toLowerCase()) {
            case "japan":
                return "japan";
            case "usa":
            case "america":
                return "america";
            case "korea":
                return "korea"; 
            default:
                return null;
        }
    
    
    }
}