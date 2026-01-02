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
        
        //カテゴリ用
        List<PageUrlEntity> findReletedSports = timeLineService.getFindCategory(sportsCode);
        
        if (findReletedSports != null) {
            for (PageUrlEntity entity : findReletedSports) {
               
                String englishName = entity.getSportsName();
                // 和名変換
                String japaneseName = convertSportsCodeToDbSportsName(englishName);
                
                // 変換できたら（nullじゃなければ）セットし直す
                if (japaneseName != null) {
                    entity.setSportsName(japaneseName);
                }
            }
        }
        model.addAttribute("relatedSports",findReletedSports);
        
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

	        // 未知のスポーツコードまたは国コードの場合のハンドリング
	        if (dbSportsName == null || dbCountryName == null) {
	            return "redirect:/"; // トップページへリダイレクト
	        }
	        
	     // ★ ここを追加：国コードに基づいた参照ページを取得
	        List<PageUrlEntity> pageUrlDto = timeLineService.getReferencePage(sportsCode, dbCountryName);
	        model.addAttribute("pageUrlList", pageUrlDto);
	        model.addAttribute("sportsCode", sportsCode);

	        //カテゴリ用
	        List<PageUrlEntity> findReletedSports = timeLineService.getFindCategory(sportsCode);
	        
	        if (findReletedSports != null) {
	            for (PageUrlEntity entity : findReletedSports) {
	               
	                String englishName = entity.getSportsName();
	                // 和名変換
	                String japaneseName = convertSportsCodeToDbSportsName(englishName);
	                
	                // 変換できたら（nullじゃなければ）セットし直す
	                if (japaneseName != null) {
	                    entity.setSportsName(japaneseName);
	                }
	            }
	        }
	        model.addAttribute("relatedSports",findReletedSports);
	        
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
        if (sportsCode == null) return null;
        
        switch (sportsCode.toLowerCase()) {
            // あ行
            case "icehockey": return "アイスホッケー";
            case "aquadance": return "アクアダンス";
            case "americanfootball": return "アメリカンフットボール";
            case "archery": return "アーチェリー";
            case "armwrestling": return "アームレスリング";
            case "iaido": return "居合道";
            case "unicycle": return "一輪車";
            case "indiaca": return "インディアカ";
            case "windsurfing": return "ウィンドサーフィン";
            case "waveski": return "ウェーブスキー";
            case "weighttraining": return "ウエイトトレーニング";
            case "weightlifting": return "ウエイトリフティング";
            case "walkrally": return "ウォークラリー";
            case "wallhandball": return "ウォールハンドボール";
            case "walking": return "ウォーキング";
            case "aerobic": return "エアロビック";
            case "airsportshooting": return "エアースポーツシューティング";
            case "eskitenis": return "エスキーテニス";
            case "oztag": return "オズタグ";
            case "orienteering": return "オリエンテーリング";
            case "okgolf": return "オーケーゴルフ";
            case "australianfootball": return "オーストラリアンフットボール";
            case "autocamping": return "オートキャンプ";

            // か行
            case "canoe": return "カヌー";
            case "kabaddi": return "カバディ";
            case "karatedo": return "空手道";
            case "kangaroocricket": return "カンガクリケット";
            case "curling": return "カーリング";
            case "balloon": return "気球";
            case "qigong": return "気功";
            case "kickbaseball": return "キックベースボール";
            case "casting": return "キャスティング";
            case "camp": return "キャンプ";
            case "kyudo": return "弓道";
            case "cricket": return "クリケット";
            case "croquet": return "クロッケー";
            case "crolity": return "クロリティー";
            case "glider": return "グライダー";
            case "groundgolf": return "グラウンド・ゴルフ";
            case "grassski": return "グラススキー";
            case "kenbiso": return "健美操";
            case "gateball": return "ゲートボール";
            case "korfball": return "コーフボール";
            case "goalball": return "ゴールボール";

            // さ行
            case "cycling": return "サイクリング";
            case "cyclesoccer": return "サイクルサッカー";
            case "cyclefigure": return "サイクルフィギュア";
            case "3btaisou": return "3B体操";
            case "sambo": return "サンボ";
            case "surfing": return "サーフィン";
            case "shuttleball": return "シャトルボール";
            case "shuffleboard": return "シャフルボード";
            case "shootboxing": return "シュートボクシング";
            case "shorinjikempo": return "少林寺拳法";
            case "shorttennis": return "ショートテニス";
            case "shorttrack": return "ショートトラック";
            case "shintakkyu": return "新卓球";
            case "jetsports": return "ジェットスポーツ";
            case "jikyojustsu": return "自彊術";
            case "jazztymnastics": return "ジャズ体操";
            case "jazzdance": return "ジャズダンス";
            case "joyathlon": return "ジョイアスロン";
            case "jogging": return "ジョギング";
            case "waterpolo": return "水球";
            case "waterski": return "水上スキー";
            case "skydive": return "スカイダイビング";
            case "squash": return "スカッシュ";
            case "ski": return "スキー";
            case "scubadiving": return "スクーバダイビング";
            case "skateboard": return "スケートボード";
            case "streetbasket": return "3x3";
            case "snowboard": return "スノーボード";
            case "snowmobile": return "スノーモービル";
            case "speedskate": return "スピードスケート";
            case "sports-onigokko": return "スポーツ鬼ごっこ";
            case "sportskite": return "スポーツカイト";
            case "sportsdiving": return "スポーツダイビング";
            case "sportschanbara": return "スポーツチャンバラ";
            case "snowballfight": return "スポーツ雪合戦";
            case "spaulbourg": return "スポールブール";
            case "sumo": return "相撲";
            case "sailtraining": return "セイルトレーニング";
            case "sepaktakraw": return "セパタクロー";
            case "sailing": return "セーリング";
            case "softvolleyball": return "ソフトバレーボール";
            case "softball": return "ソフトボール";
            case "songleading": return "チアダンス";

            // た行
            case "taspony": return "タスポニー";
            case "touchfootball": return "タッチフットボール";
            case "touchrugby": return "タッチラグビー";
            case "targetbirdgolf": return "ターゲット・バードゴルフ";
            case "doubledutch": return "ダブルダッチ";
            case "dancesports": return "ダンススポーツ";
            case "darts": return "ダーツ";
            case "tschoukball": return "チュックボール";
            case "tugofwar": return "綱引競技";
            case "fishing": return "釣り";
            case "teeball": return "ティーボール";
            case "duathlon": return "デュアスロン";
            case "denmarktymnastics": return "デンマーク体操";
            case "tossbaseball": return "トスベースボール";
            case "triathlon": return "トライアスロン";
            case "trampolinebics": return "トランポビクス";
            case "trampoline": return "トランポリン";
            case "trittball": return "トリットボール";
            case "trekking": return "トレッキング";
            case "dodgeball": return "ドッジボール";
            case "dragonboat": return "ドラゴンボート";

            // な・は行
            case "naginata": return "なぎなた";
            case "nastarrace": return "ナスターレース";
            case "jumprope": return "なわとび";
            case "netball": return "ネットボール";
            case "hiking": return "ハイキング";
            case "hanggliding": return "ハンググライディング";
            case "handball": return "ハンドボール";
            case "bmx": return "BMX";
            case "boundtennis": return "バウンドテニス";
            case "equestrian": return "馬術";
            case "batontwirling": return "バトントワリング";
            case "pattpatgolf": return "パットパットゴルフ";
            case "paddletennis": return "パドルテニス";
            case "paragliding": return "パラグライディング";
            case "parachutesports": return "パラシュートスポーツ";
            case "powerlifting": return "パワーリフティング";
            case "parkgolf": return "パークゴルフ";
            case "billiards": return "ビリヤード";
            case "beachsoccer": return "ビーチサッカー";
            case "beachvolleyball": return "ビーチバレーボール";
            case "beachfootball": return "ビーチフットボール";
            case "beachball": return "ビーチボール";
            case "faustball": return "ファウストボール";
            case "figureskate": return "フィギュアスケート";
            case "finswimming": return "フィンスイミング";
            case "fencing": return "フェンシング";
            case "folkdance": return "フォークダンス";
            case "futsal": return "フットサル";
            case "footbag": return "フットバッグ";
            case "flyingdisc": return "フライングディスク";
            case "flagfootball": return "フラッグフットボール";
            case "frisbeedog": return "フリスビードッグ";
            case "freetennis": return "フリーテニス";
            case "floorhockey": return "フロアホッケー";
            case "bujuttaikyokuken": return "武術太極拳";
            case "broomball": return "ブルームボール";
            case "boomerang": return "ブーメラン";
            case "pencaksilat": return "プンチャック・シラット";
            case "petanque": return "ペタンク";
            case "hosteling": return "ホステリング";
            case "hockey": return "ホッケー";
            case "horseshoes": return "ホースシューズ";
            case "bowling": return "ボウリング";
            case "boccia": return "ボッチャ";
            case "bodybuilding": return "ボディビル";
            case "bodyboard": return "ボディボード";
            case "boat": return "ボート";
            case "polo": return "ポロ";

            // ま・や・ら・わ行
            case "microlightplane": return "マイクロライトプレーン";
            case "mountainbike": return "マウンテンバイク";
            case "makkoh": return "真向法";
            case "malletgolf": return "マレットゴルフ";
            case "motorcyclesports": return "モーターサイクル";
            case "unicurl": return "ユニカール";
            case "unihoc": return "ユニホック";
            case "lifesaving": return "ライフセービング";
            case "lacrosse": return "ラクロス";
            case "rugbyleague": return "ラグビーリーグ";
            case "racquetball": return "ラケットボール";
            case "radioexercies": return "ラジオ体操";
            case "rollerski": return "ローラースキー";
            case "rollerskates": return "ローラースケート";
            case "lawnbowls": return "ローンボウルズ";
            
            // メインスポーツ
            case "baseball": return "野球";
            case "soccer": return "サッカー";
            case "judo": return "柔道";
            case "basketball": return "バスケットボール";
            case "swimming": return "水泳";
            case "kendo": return "剣道";
            case "wrestling": return "レスリング";
            case "athletics": return "陸上競技";
            case "tennis": return "テニス";
            case "volleyball": return "バレーボール";
            case "gymnastics": return "体操";
            case "tabletennis": return "卓球";
            case "badminton": return "バドミントン";
            case "golf": return "ゴルフ";
            case "boxing": return "ボクシング";
            case "rugby": return "ラグビー";
            case "aikido": return "合気道";

            default: return sportsCode; // 見つからない場合はそのまま
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