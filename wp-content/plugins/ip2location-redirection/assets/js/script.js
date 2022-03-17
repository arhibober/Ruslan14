jQuery(document).ready(function($) {
    var promptSave = false;

    load_rules();
    refresh_settings();

    $(window).on('beforeunload', function(e) {
        if (promptSave) {
            return 'Your rules has been modified. Leave this page without save the changes?';
        }
    });

    $('input[name="submit"]').on('click', function() {
        promptSave = false;
    });

    $('select').on('change', function() {
        promptSave = true;
    });

    $('input[name=lookup_mode]').on('change', function() {
        refresh_settings();
    });

    $('#download').on('click', function(e) {
        e.preventDefault();

        if ($('#database_name').val().length == 0 || $('#token').val().length == 0) {
            $('#download_status').html('<div id="message" class="error"><p><strong>ERROR</strong>: Please make sure you have entered the login crendential.</p></div>');
            return;
        }

        $('#download_status').html('');
        $('#database_name,#token,#download').prop('disabled', true);
        $('#ip2location-download-progress').show();

        $.post(ajaxurl, {
            action: 'ip2location_redirection_update_database',
            database: $('#database_name').val(),
            token: $('#token').val()
        }, function(response) {
            if (response == 'SUCCESS') {
                alert('Download completed.');

                $('#download_status').html('<div id="message" class="updated"><p>Successfully downloaded the ' + $('#database_name :selected').text() + ' BIN database. Please refresh information by <a href="javascript:;" id="reload">reloading</a> the page.</p></div>');

                $('#reload').on('click', function() {
                    window.location = window.location.href.split('#')[0];
                });
            } else {
                alert(response);

                $('#download_status').html('<div id="message" class="error"><p><strong>ERROR</strong>: Failed to download ' + $('#database_name :selected').text() + ' BIN database. Please make sure you correctly enter the login crendential.</p></div>');
            }
        }).always(function() {
            $('#database_name').val('');
            $('#database_name,#token,#download').prop('disabled', false);
            $('#ip2location-download-progress').hide();
        });
    });

    function insert_rule(country_codes, from, to, url_from, url_to, http_code) {
        var countries = {
            "": "",
            "AF": "Afghanistan",
            "AL": "Albania",
            "DZ": "Algeria",
            "AS": "American Samoa",
            "AD": "Andorra",
            "AO": "Angola",
            "AI": "Anguilla",
            "AQ": "Antarctica",
            "AG": "Antigua And Barbuda",
            "AR": "Argentina",
            "AM": "Armenia",
            "AW": "Aruba",
            "AU": "Australia",
            "AT": "Austria",
            "AZ": "Azerbaijan",
            "BS": "Bahamas",
            "BH": "Bahrain",
            "BD": "Bangladesh",
            "BB": "Barbados",
            "BY": "Belarus",
            "BE": "Belgium",
            "BZ": "Belize",
            "BJ": "Benin",
            "BM": "Bermuda",
            "BT": "Bhutan",
            "BO": "Bolivia, Plurinational State Of",
            "BQ": "Bonaire, Sint Eustatius And Saba",
            "BA": "Bosnia And Herzegovina",
            "BW": "Botswana",
            "BV": "Bouvet Island",
            "BR": "Brazil",
            "IO": "British Indian Ocean Territory",
            "BN": "Brunei Darussalam",
            "BG": "Bulgaria",
            "BF": "Burkina Faso",
            "BI": "Burundi",
            "KH": "Cambodia",
            "CM": "Cameroon",
            "CA": "Canada",
            "CV": "Cape Verde",
            "KY": "Cayman Islands",
            "CF": "Central African Republic",
            "TD": "Chad",
            "CL": "Chile",
            "CN": "China",
            "CX": "Christmas Island",
            "CC": "Cocos (keeling) Islands",
            "CO": "Colombia",
            "KM": "Comoros",
            "CG": "Congo",
            "CD": "Congo, The Democratic Republic Of The",
            "CK": "Cook Islands",
            "CR": "Costa Rica",
            "HR": "Croatia",
            "CU": "Cuba",
            "CW": "Cura\u00c7ao",
            "CY": "Cyprus",
            "CZ": "Czech Republic",
            "CI": "C\u00d4te D\'Ivoire",
            "DK": "Denmark",
            "DJ": "Djibouti",
            "DM": "Dominica",
            "DO": "Dominican Republic",
            "EC": "Ecuador",
            "EG": "Egypt",
            "SV": "El Salvador",
            "GQ": "Equatorial Guinea",
            "ER": "Eritrea",
            "EE": "Estonia",
            "ET": "Ethiopia",
            "FK": "Falkland Islands (malvinas)",
            "FO": "Faroe Islands",
            "FJ": "Fiji",
            "FI": "Finland",
            "FR": "France",
            "GF": "French Guiana",
            "PF": "French Polynesia",
            "TF": "French Southern Territories",
            "GA": "Gabon",
            "GM": "Gambia",
            "GE": "Georgia",
            "DE": "Germany",
            "GH": "Ghana",
            "GI": "Gibraltar",
            "GR": "Greece",
            "GL": "Greenland",
            "GD": "Grenada",
            "GP": "Guadeloupe",
            "GU": "Guam",
            "GT": "Guatemala",
            "GG": "Guernsey",
            "GN": "Guinea",
            "GW": "Guinea-bissau",
            "GY": "Guyana",
            "HT": "Haiti",
            "HM": "Heard Island And Mcdonald Islands",
            "VA": "Holy See (vatican City State)",
            "HN": "Honduras",
            "HK": "Hong Kong",
            "HU": "Hungary",
            "IS": "Iceland",
            "IN": "India",
            "ID": "Indonesia",
            "IR": "Iran, Islamic Republic Of",
            "IQ": "Iraq",
            "IE": "Ireland",
            "IM": "Isle Of Man",
            "IL": "Israel",
            "IT": "Italy",
            "JM": "Jamaica",
            "JP": "Japan",
            "JE": "Jersey",
            "JO": "Jordan",
            "KZ": "Kazakhstan",
            "KE": "Kenya",
            "KI": "Kiribati",
            "KP": "Korea, Democratic People\'s Republic Of",
            "KR": "Korea, Republic Of",
            "KW": "Kuwait",
            "KG": "Kyrgyzstan",
            "LA": "Lao People\'s Democratic Republic",
            "LV": "Latvia",
            "LB": "Lebanon",
            "LS": "Lesotho",
            "LR": "Liberia",
            "LY": "Libya",
            "LI": "Liechtenstein",
            "LT": "Lithuania",
            "LU": "Luxembourg",
            "MO": "Macao",
            "MK": "Macedonia, The Former Yugoslav Republic Of",
            "MG": "Madagascar",
            "MW": "Malawi",
            "MY": "Malaysia",
            "MV": "Maldives",
            "ML": "Mali",
            "MT": "Malta",
            "MH": "Marshall Islands",
            "MQ": "Martinique",
            "MR": "Mauritania",
            "MU": "Mauritius",
            "YT": "Mayotte",
            "MX": "Mexico",
            "FM": "Micronesia, Federated States Of",
            "MD": "Moldova, Republic Of",
            "MC": "Monaco",
            "MN": "Mongolia",
            "ME": "Montenegro",
            "MS": "Montserrat",
            "MA": "Morocco",
            "MZ": "Mozambique",
            "MM": "Myanmar",
            "NA": "Namibia",
            "NR": "Nauru",
            "NP": "Nepal",
            "NL": "Netherlands",
            "NC": "New Caledonia",
            "NZ": "New Zealand",
            "NI": "Nicaragua",
            "NE": "Niger",
            "NG": "Nigeria",
            "NU": "Niue",
            "NF": "Norfolk Island",
            "MP": "Northern Mariana Islands",
            "NO": "Norway",
            "OM": "Oman",
            "PK": "Pakistan",
            "PW": "Palau",
            "PS": "Palestinian Territory, Occupied",
            "PA": "Panama",
            "PG": "Papua New Guinea",
            "PY": "Paraguay",
            "PE": "Peru",
            "PH": "Philippines",
            "PN": "Pitcairn",
            "PL": "Poland",
            "PT": "Portugal",
            "PR": "Puerto Rico",
            "QA": "Qatar",
            "RO": "Romania",
            "RU": "Russian Federation",
            "RW": "Rwanda",
            "RE": "R\u00c9union",
            "BL": "Saint Barth\u00c9lemy",
            "SH": "Saint Helena, Ascension And Tristan Da Cunha",
            "KN": "Saint Kitts And Nevis",
            "LC": "Saint Lucia",
            "MF": "Saint Martin (french Part)",
            "PM": "Saint Pierre And Miquelon",
            "VC": "Saint Vincent And The Grenadines",
            "WS": "Samoa",
            "SM": "San Marino",
            "ST": "Sao Tome And Principe",
            "SA": "Saudi Arabia",
            "SN": "Senegal",
            "RS": "Serbia",
            "SC": "Seychelles",
            "SL": "Sierra Leone",
            "SG": "Singapore",
            "SX": "Sint Maarten (dutch Part)",
            "SK": "Slovakia",
            "SI": "Slovenia",
            "SB": "Solomon Islands",
            "SO": "Somalia",
            "ZA": "South Africa",
            "GS": "South Georgia And The South Sandwich Islands",
            "SS": "South Sudan",
            "ES": "Spain",
            "LK": "Sri Lanka",
            "SD": "Sudan",
            "SR": "Suriname",
            "SJ": "Svalbard And Jan Mayen",
            "SZ": "Swaziland",
            "SE": "Sweden",
            "CH": "Switzerland",
            "SY": "Syrian Arab Republic",
            "TW": "Taiwan, Province Of China",
            "TJ": "Tajikistan",
            "TZ": "Tanzania, United Republic Of",
            "TH": "Thailand",
            "TL": "Timor-leste",
            "TG": "Togo",
            "TK": "Tokelau",
            "TO": "Tonga",
            "TT": "Trinidad And Tobago",
            "TN": "Tunisia",
            "TR": "Turkey",
            "TM": "Turkmenistan",
            "TC": "Turks And Caicos Islands",
            "TV": "Tuvalu",
            "UG": "Uganda",
            "UA": "Ukraine",
            "AE": "United Arab Emirates",
            "GB": "United Kingdom",
            "US": "United States",
            "UM": "United States Minor Outlying Islands",
            "UY": "Uruguay",
            "UZ": "Uzbekistan",
            "VU": "Vanuatu",
            "VE": "Venezuela, Bolivarian Republic Of",
            "VN": "Viet Nam",
            "VG": "Virgin Islands, British",
            "VI": "Virgin Islands, U.s.",
            "WF": "Wallis And Futuna",
            "EH": "Western Sahara",
            "YE": "Yemen",
            "ZM": "Zambia",
            "ZW": "Zimbabwe",
            "AX": "\u00c5land Islands"
        };

		var regions =  {
			'AD': {
				'AD.07': 'Andorra la Vella', 'AD.02': 'Canillo', 'AD.03': 'Encamp', 'AD.08': 'Escaldes-Engordany', 'AD.04': 'La Massana', 'AD.05': 'Ordino', 'AD.06': 'Sant Julia de Loria',
			},
			'AE': {
				'AE.AJ': '\'Ajman', 'AE.AZ': 'Abu Zaby', 'AE.FU': 'Al Fujayrah', 'AE.SH': 'Ash Shariqah', 'AE.DU': 'Dubayy', 'AE.RK': 'Ra\'s al Khaymah', 'AE.UQ': 'Umm al Qaywayn',
			},
			'AF': {
				'AF.BGL': 'Baghlan', 'AF.BAL': 'Balkh', 'AF.BAM': 'Bamyan', 'AF.FYB': 'Faryab', 'AF.HEL': 'Helmand', 'AF.HER': 'Herat', 'AF.KAB': 'Kabul', 'AF.KAN': 'Kandahar', 'AF.KHO': 'Khost', 'AF.KDZ': 'Kunduz', 'AF.LOG': 'Logar', 'AF.NAN': 'Nangarhar', 'AF.NIM': 'Nimroz', 'AF.PKA': 'Paktika', 'AF.PIA': 'Paktiya', 'AF.PAR': 'Parwan', 'AF.TAK': 'Takhar', 'AF.URU': 'Uruzgan',
			},
			'AG': {
				'AG.11': 'Redonda', 'AG.03': 'Saint George', 'AG.04': 'Saint John', 'AG.05': 'Saint Mary', 'AG.06': 'Saint Paul', 'AG.07': 'Saint Peter', 'AG.08': 'Saint Philip',
			},
			'AL': {
				'AL.01': 'Berat', 'AL.09': 'Diber', 'AL.02': 'Durres', 'AL.03': 'Elbasan', 'AL.04': 'Fier', 'AL.05': 'Gjirokaster', 'AL.06': 'Korce', 'AL.07': 'Kukes', 'AL.08': 'Lezhe', 'AL.10': 'Shkoder', 'AL.11': 'Tirane', 'AL.12': 'Vlore',
			},
			'AM': {
				'AM.AG': 'Aragacotn', 'AM.AR': 'Ararat', 'AM.AV': 'Armavir', 'AM.ER': 'Erevan', 'AM.GR': 'Gegark\'unik\'', 'AM.KT': 'Kotayk\'', 'AM.LO': 'Lori', 'AM.SH': 'Sirak', 'AM.SU': 'Syunik\'', 'AM.TV': 'Tavus', 'AM.VD': 'Vayoc Jor',
			},
			'AO': {
				'AO.BGO': 'Bengo', 'AO.BGU': 'Benguela', 'AO.BIE': 'Bie', 'AO.CAB': 'Cabinda', 'AO.CNN': 'Cunene', 'AO.HUA': 'Huambo', 'AO.HUI': 'Huila', 'AO.CCU': 'Kuando Kubango', 'AO.CNO': 'Kwanza Norte', 'AO.CUS': 'Kwanza Sul', 'AO.LUA': 'Luanda', 'AO.LNO': 'Lunda Norte', 'AO.LSU': 'Lunda Sul', 'AO.MAL': 'Malange', 'AO.MOX': 'Moxico', 'AO.NAM': 'Namibe', 'AO.UIG': 'Uige', 'AO.ZAI': 'Zaire',
			},
			'AR': {
				'AR.B': 'Buenos Aires', 'AR.K': 'Catamarca', 'AR.H': 'Chaco', 'AR.U': 'Chubut', 'AR.C': 'Ciudad Autonoma de Buenos Aires', 'AR.X': 'Cordoba', 'AR.W': 'Corrientes', 'AR.E': 'Entre Rios', 'AR.P': 'Formosa', 'AR.Y': 'Jujuy', 'AR.L': 'La Pampa', 'AR.F': 'La Rioja', 'AR.M': 'Mendoza', 'AR.N': 'Misiones', 'AR.Q': 'Neuquen', 'AR.R': 'Rio Negro', 'AR.A': 'Salta', 'AR.J': 'San Juan', 'AR.D': 'San Luis', 'AR.Z': 'Santa Cruz', 'AR.S': 'Santa Fe', 'AR.G': 'Santiago del Estero', 'AR.V': 'Tierra del Fuego', 'AR.T': 'Tucuman',
			},
			'AT': {
				'AT.1': 'Burgenland', 'AT.2': 'Karnten', 'AT.3': 'Niederosterreich', 'AT.4': 'Oberosterreich', 'AT.5': 'Salzburg', 'AT.6': 'Steiermark', 'AT.7': 'Tirol', 'AT.8': 'Vorarlberg', 'AT.9': 'Wien',
			},
			'AU': {
				'AU.ACT': 'Australian Capital Territory', 'AU.NSW': 'New South Wales', 'AU.NT': 'Northern Territory', 'AU.QLD': 'Queensland', 'AU.SA': 'South Australia', 'AU.TAS': 'Tasmania', 'AU.VIC': 'Victoria', 'AU.WA': 'Western Australia',
			},
			'AZ': {
				'AZ.ABS': 'Abseron', 'AZ.AGC': 'Agcabadi', 'AZ.AGS': 'Agdas', 'AZ.AGA': 'Agstafa', 'AZ.AGU': 'Agsu', 'AZ.AST': 'Astara', 'AZ.BA': 'Baki', 'AZ.BAL': 'Balakan', 'AZ.BAR': 'Barda', 'AZ.BEY': 'Beylaqan', 'AZ.CAL': 'Calilabad', 'AZ.DAS': 'Daskasan', 'AZ.GAD': 'Gadabay', 'AZ.GA': 'Ganca', 'AZ.GOR': 'Goranboy', 'AZ.GOY': 'Goycay', 'AZ.GYG': 'Goygol', 'AZ.HAC': 'Haciqabul', 'AZ.IMI': 'Imisli', 'AZ.KUR': 'Kurdamir', 'AZ.LA': 'Lankaran', 'AZ.MAS': 'Masalli', 'AZ.MI': 'Mingacevir', 'AZ.NA': 'Naftalan', 'AZ.NX': 'Naxcivan', 'AZ.NEF': 'Neftcala', 'AZ.OGU': 'Oguz', 'AZ.QAB': 'Qabala', 'AZ.QAX': 'Qax', 'AZ.QAZ': 'Qazax', 'AZ.QBA': 'Quba', 'AZ.QUS': 'Qusar', 'AZ.SAB': 'Sabirabad', 'AZ.SAK': 'Saki', 'AZ.SAL': 'Salyan', 'AZ.SMI': 'Samaxi', 'AZ.SKR': 'Samkir', 'AZ.SMX': 'Samux', 'AZ.SR': 'Sirvan', 'AZ.SIY': 'Siyazan', 'AZ.SM': 'Sumqayit', 'AZ.TOV': 'Tovuz', 'AZ.XAC': 'Xacmaz', 'AZ.XIZ': 'Xizi', 'AZ.YEV': 'Yevlax', 'AZ.ZAQ': 'Zaqatala',
			},
			'BA': {
				'BA.BRC': 'Brcko distrikt', 'BA.BIH': 'Federacija Bosne i Hercegovine', 'BA.SRP': 'Republika Srpska',
			},
			'BB': {
				'BB.01': 'Christ Church', 'BB.02': 'Saint Andrew', 'BB.03': 'Saint George', 'BB.04': 'Saint James', 'BB.05': 'Saint John', 'BB.06': 'Saint Joseph', 'BB.07': 'Saint Lucy', 'BB.08': 'Saint Michael', 'BB.09': 'Saint Peter', 'BB.10': 'Saint Philip', 'BB.11': 'Saint Thomas',
			},
			'BD': {
				'BD.A': 'Barisal', 'BD.B': 'Chittagong', 'BD.C': 'Dhaka', 'BD.D': 'Khulna', 'BD.E': 'Rajshahi', 'BD.F': 'Rangpur', 'BD.G': 'Sylhet',
			},
			'BE': {
				'BE.VAN': 'Antwerpen', 'BE.WBR': 'Brabant wallon', 'BE.BRU': 'Brussels Hoofdstedelijk Gewest', 'BE.WHT': 'Hainaut', 'BE.WLG': 'Liege', 'BE.VLI': 'Limburg', 'BE.WLX': 'Luxembourg', 'BE.WNA': 'Namur', 'BE.VOV': 'Oost-Vlaanderen', 'BE.VBR': 'Vlaams-Brabant', 'BE.VWV': 'West-Vlaanderen',
			},
			'BF': {
				'BF.BLG': 'Boulgou', 'BF.BLK': 'Boulkiemde', 'BF.COM': 'Comoe', 'BF.GNA': 'Gnagna', 'BF.HOU': 'Houet', 'BF.KAD': 'Kadiogo', 'BF.KOW': 'Kourweogo', 'BF.LER': 'Leraba', 'BF.MOU': 'Mouhoun', 'BF.NAO': 'Nahouri', 'BF.PON': 'Poni', 'BF.SMT': 'Sanmatenga', 'BF.TAP': 'Tapoa', 'BF.TUI': 'Tuy', 'BF.YAT': 'Yatenga', 'BF.ZOU': 'Zoundweogo',
			},
			'BG': {
				'BG.01': 'Blagoevgrad', 'BG.02': 'Burgas', 'BG.08': 'Dobrich', 'BG.07': 'Gabrovo', 'BG.26': 'Haskovo', 'BG.09': 'Kardzhali', 'BG.10': 'Kyustendil', 'BG.11': 'Lovech', 'BG.12': 'Montana', 'BG.13': 'Pazardzhik', 'BG.14': 'Pernik', 'BG.15': 'Pleven', 'BG.16': 'Plovdiv', 'BG.17': 'Razgrad', 'BG.18': 'Ruse', 'BG.27': 'Shumen', 'BG.19': 'Silistra', 'BG.20': 'Sliven', 'BG.21': 'Smolyan', 'BG.23': 'Sofia', 'BG.22': 'Sofia (stolitsa)', 'BG.24': 'Stara Zagora', 'BG.25': 'Targovishte', 'BG.03': 'Varna', 'BG.04': 'Veliko Tarnovo', 'BG.05': 'Vidin', 'BG.06': 'Vratsa', 'BG.28': 'Yambol',
			},
			'BH': {
				'BH.13': 'Al \'Asimah', 'BH.14': 'Al Janubiyah', 'BH.15': 'Al Muharraq', 'BH.17': 'Ash Shamaliyah',
			},
			'BI': {
				'BI.BB': 'Bubanza', 'BI.BM': 'Bujumbura Mairie', 'BI.BR': 'Bururi', 'BI.CI': 'Cibitoke', 'BI.GI': 'Gitega', 'BI.KI': 'Kirundo', 'BI.MY': 'Muyinga', 'BI.MW': 'Mwaro', 'BI.NG': 'Ngozi', 'BI.RT': 'Rutana', 'BI.RY': 'Ruyigi',
			},
			'BJ': {
				'BJ.AL': 'Alibori', 'BJ.AK': 'Atacora', 'BJ.AQ': 'Atlantique', 'BJ.BO': 'Borgou', 'BJ.DO': 'Donga', 'BJ.LI': 'Littoral', 'BJ.MO': 'Mono', 'BJ.OU': 'Oueme', 'BJ.PL': 'Plateau', 'BJ.ZO': 'Zou',
			},
			'BN': {
				'BN.BE': 'Belait', 'BN.BM': 'Brunei-Muara', 'BN.TE': 'Temburong', 'BN.TU': 'Tutong',
			},
			'BO': {
				'BO.H': 'Chuquisaca', 'BO.C': 'Cochabamba', 'BO.B': 'El Beni', 'BO.L': 'La Paz', 'BO.O': 'Oruro', 'BO.N': 'Pando', 'BO.P': 'Potosi', 'BO.S': 'Santa Cruz', 'BO.T': 'Tarija',
			},
			'BQ': {
				'BQ.BO': 'Bonaire', 'BQ.SA': 'Saba', 'BQ.SE': 'Sint Eustatius',
			},
			'BR': {
				'BR.AC': 'Acre', 'BR.AL': 'Alagoas', 'BR.AP': 'Amapa', 'BR.AM': 'Amazonas', 'BR.BA': 'Bahia', 'BR.CE': 'Ceara', 'BR.DF': 'Distrito Federal', 'BR.ES': 'Espirito Santo', 'BR.GO': 'Goias', 'BR.MA': 'Maranhao', 'BR.MT': 'Mato Grosso', 'BR.MS': 'Mato Grosso do Sul', 'BR.MG': 'Minas Gerais', 'BR.PA': 'Para', 'BR.PB': 'Paraiba', 'BR.PR': 'Parana', 'BR.PE': 'Pernambuco', 'BR.PI': 'Piaui', 'BR.RN': 'Rio Grande do Norte', 'BR.RS': 'Rio Grande do Sul', 'BR.RJ': 'Rio de Janeiro', 'BR.RO': 'Rondonia', 'BR.RR': 'Roraima', 'BR.SC': 'Santa Catarina', 'BR.SP': 'Sao Paulo', 'BR.SE': 'Sergipe', 'BR.TO': 'Tocantins',
			},
			'BS': {
				'BS.CS': 'Central Andros', 'BS.FP': 'City of Freeport', 'BS.HI': 'Harbour Island', 'BS.HT': 'Hope Town', 'BS.LI': 'Long Island', 'BS.NP': 'New Providence', 'BS.SE': 'South Eleuthera',
			},
			'BT': {
				'BT.33': 'Bumthang', 'BT.12': 'Chhukha', 'BT.GA': 'Gasa', 'BT.13': 'Haa', 'BT.44': 'Lhuentse', 'BT.42': 'Monggar', 'BT.11': 'Paro', 'BT.43': 'Pemagatshel', 'BT.23': 'Punakha', 'BT.45': 'Samdrup Jongkhar', 'BT.14': 'Samtse', 'BT.15': 'Thimphu', 'BT.41': 'Trashigang', 'BT.32': 'Trongsa', 'BT.21': 'Tsirang', 'BT.24': 'Wangdue Phodrang',
			},
			'BW': {
				'BW.CE': 'Central', 'BW.KL': 'Kgatleng', 'BW.KW': 'Kweneng', 'BW.NE': 'North East', 'BW.NW': 'North West', 'BW.SE': 'South East', 'BW.SO': 'Southern',
			},
			'BY': {
				'BY.BR': 'Brestskaya voblasts\'', 'BY.HO': 'Homyel\'skaya voblasts\'', 'BY.HM': 'Horad Minsk', 'BY.HR': 'Hrodzenskaya voblasts\'', 'BY.MA': 'Mahilyowskaya voblasts\'', 'BY.MI': 'Minskaya voblasts\'', 'BY.VI': 'Vitsyebskaya voblasts\'',
			},
			'BZ': {
				'BZ.BZ': 'Belize', 'BZ.CY': 'Cayo', 'BZ.CZL': 'Corozal', 'BZ.OW': 'Orange Walk', 'BZ.SC': 'Stann Creek', 'BZ.TOL': 'Toledo',
			},
			'CA': {
				'CA.AB': 'Alberta', 'CA.BC': 'British Columbia', 'CA.MB': 'Manitoba', 'CA.NB': 'New Brunswick', 'CA.NL': 'Newfoundland and Labrador', 'CA.NT': 'Northwest Territories', 'CA.NS': 'Nova Scotia', 'CA.NU': 'Nunavut', 'CA.ON': 'Ontario', 'CA.PE': 'Prince Edward Island', 'CA.QC': 'Quebec', 'CA.SK': 'Saskatchewan', 'CA.YT': 'Yukon',
			},
			'CD': {
				'CD.EQ': 'Equateur', 'CD.HK': 'Haut-Katanga', 'CD.IT': 'Ituri', 'CD.KC': 'Kasai Central', 'CD.KE': 'Kasai Oriental', 'CD.KN': 'Kinshasa', 'CD.BC': 'Kongo Central', 'CD.KL': 'Kwilu', 'CD.LU': 'Lualaba', 'CD.MA': 'Maniema', 'CD.NK': 'Nord-Kivu', 'CD.NU': 'Nord-Ubangi', 'CD.SA': 'Sankuru', 'CD.SK': 'Sud-Kivu', 'CD.SU': 'Sud-Ubangi', 'CD.TA': 'Tanganyika', 'CD.TO': 'Tshopo', 'CD.TU': 'Tshuapa',
			},
			'CF': {
				'CF.BGF': 'Bangui', 'CF.HK': 'Haute-Kotto', 'CF.NM': 'Nana-Mambere', 'CF.AC': 'Ouham',
			},
			'CG': {
				'CG.BZV': 'Brazzaville', 'CG.8': 'Cuvette', 'CG.15': 'Cuvette-Ouest', 'CG.16': 'Pointe-Noire', 'CG.13': 'Sangha',
			},
			'CH': {
				'CH.AG': 'Aargau', 'CH.AR': 'Appenzell Ausserrhoden', 'CH.AI': 'Appenzell Innerrhoden', 'CH.BL': 'Basel-Landschaft', 'CH.BS': 'Basel-Stadt', 'CH.BE': 'Bern', 'CH.FR': 'Fribourg', 'CH.GE': 'Geneve', 'CH.GL': 'Glarus', 'CH.GR': 'Graubunden', 'CH.JU': 'Jura', 'CH.LU': 'Luzern', 'CH.NE': 'Neuchatel', 'CH.NW': 'Nidwalden', 'CH.OW': 'Obwalden', 'CH.SG': 'Sankt Gallen', 'CH.SH': 'Schaffhausen', 'CH.SZ': 'Schwyz', 'CH.SO': 'Solothurn', 'CH.TG': 'Thurgau', 'CH.TI': 'Ticino', 'CH.UR': 'Uri', 'CH.VS': 'Valais', 'CH.VD': 'Vaud', 'CH.ZG': 'Zug', 'CH.ZH': 'Zurich',
			},
			'CI': {
				'CI.AB': 'Abidjan', 'CI.BS': 'Bas-Sassandra', 'CI.CM': 'Comoe', 'CI.DN': 'Denguele', 'CI.GD': 'Goh-Djiboua', 'CI.LC': 'Lacs', 'CI.LG': 'Lagunes', 'CI.MG': 'Montagnes', 'CI.SM': 'Sassandra-Marahoue', 'CI.SV': 'Savanes', 'CI.VB': 'Vallee du Bandama', 'CI.WR': 'Woroba', 'CI.YM': 'Yamoussoukro', 'CI.ZZ': 'Zanzan',
			},
			'CL': {
				'CL.AI': 'Aisen del General Carlos Ibanez del Campo', 'CL.AN': 'Antofagasta', 'CL.AP': 'Arica y Parinacota', 'CL.AT': 'Atacama', 'CL.BI': 'Biobio', 'CL.CO': 'Coquimbo', 'CL.AR': 'La Araucania', 'CL.LI': 'Libertador General Bernardo O\'Higgins', 'CL.LL': 'Los Lagos', 'CL.LR': 'Los Rios', 'CL.MA': 'Magallanes', 'CL.ML': 'Maule', 'CL.RM': 'Region Metropolitana de Santiago', 'CL.TA': 'Tarapaca', 'CL.VS': 'Valparaiso',
			},
			'CM': {
				'CM.AD': 'Adamaoua', 'CM.CE': 'Centre', 'CM.ES': 'Est', 'CM.EN': 'Extreme-Nord', 'CM.LT': 'Littoral', 'CM.NO': 'Nord', 'CM.NW': 'Nord-Ouest', 'CM.OU': 'Ouest', 'CM.SU': 'Sud', 'CM.SW': 'Sud-Ouest',
			},
			'CN': {
				'CN.AH': 'Anhui', 'CN.BJ': 'Beijing', 'CN.CQ': 'Chongqing', 'CN.FJ': 'Fujian', 'CN.GS': 'Gansu', 'CN.GD': 'Guangdong', 'CN.GX': 'Guangxi', 'CN.GZ': 'Guizhou', 'CN.HI': 'Hainan', 'CN.HE': 'Hebei', 'CN.HL': 'Heilongjiang', 'CN.HA': 'Henan', 'CN.HB': 'Hubei', 'CN.HN': 'Hunan', 'CN.JS': 'Jiangsu', 'CN.JX': 'Jiangxi', 'CN.JL': 'Jilin', 'CN.LN': 'Liaoning', 'CN.NM': 'Nei Mongol', 'CN.NX': 'Ningxia', 'CN.QH': 'Qinghai', 'CN.SN': 'Shaanxi', 'CN.SD': 'Shandong', 'CN.SH': 'Shanghai', 'CN.SX': 'Shanxi', 'CN.SC': 'Sichuan', 'CN.TJ': 'Tianjin', 'CN.XJ': 'Xinjiang', 'CN.XZ': 'Xizang', 'CN.YN': 'Yunnan', 'CN.ZJ': 'Zhejiang',
			},
			'CO': {
				'CO.AMA': 'Amazonas', 'CO.ANT': 'Antioquia', 'CO.ARA': 'Arauca', 'CO.ATL': 'Atlantico', 'CO.BOL': 'Bolivar', 'CO.BOY': 'Boyaca', 'CO.CAL': 'Caldas', 'CO.CAQ': 'Caqueta', 'CO.CAS': 'Casanare', 'CO.CAU': 'Cauca', 'CO.CES': 'Cesar', 'CO.CHO': 'Choco', 'CO.COR': 'Cordoba', 'CO.CUN': 'Cundinamarca', 'CO.DC': 'Distrito Capital de Bogota', 'CO.GUA': 'Guainia', 'CO.GUV': 'Guaviare', 'CO.HUI': 'Huila', 'CO.LAG': 'La Guajira', 'CO.MAG': 'Magdalena', 'CO.MET': 'Meta', 'CO.NAR': 'Narino', 'CO.NSA': 'Norte de Santander', 'CO.PUT': 'Putumayo', 'CO.QUI': 'Quindio', 'CO.RIS': 'Risaralda', 'CO.SAP': 'San Andres, Providencia y Santa Catalina', 'CO.SAN': 'Santander', 'CO.SUC': 'Sucre', 'CO.TOL': 'Tolima', 'CO.VAC': 'Valle del Cauca', 'CO.VAU': 'Vaupes', 'CO.VID': 'Vichada',
			},
			'CR': {
				'CR.A': 'Alajuela', 'CR.C': 'Cartago', 'CR.G': 'Guanacaste', 'CR.H': 'Heredia', 'CR.L': 'Limon', 'CR.P': 'Puntarenas', 'CR.SJ': 'San Jose',
			},
			'CU': {
				'CU.15': 'Artemisa', 'CU.09': 'Camaguey', 'CU.08': 'Ciego de Avila', 'CU.06': 'Cienfuegos', 'CU.12': 'Granma', 'CU.14': 'Guantanamo', 'CU.11': 'Holguin', 'CU.03': 'La Habana', 'CU.10': 'Las Tunas', 'CU.04': 'Matanzas', 'CU.16': 'Mayabeque', 'CU.01': 'Pinar del Rio', 'CU.07': 'Sancti Spiritus', 'CU.13': 'Santiago de Cuba', 'CU.05': 'Villa Clara',
			},
			'CV': {
				'CV.BV': 'Boa Vista', 'CV.PN': 'Porto Novo', 'CV.PR': 'Praia', 'CV.SL': 'Sal', 'CV.SV': 'Sao Vicente',
			},
			'CY': {
				'CY.04': 'Ammochostos', 'CY.06': 'Keryneia', 'CY.03': 'Larnaka', 'CY.01': 'Lefkosia', 'CY.02': 'Lemesos', 'CY.05': 'Pafos',
			},
			'CZ': {
				'CZ.31': 'Jihocesky kraj', 'CZ.64': 'Jihomoravsky kraj', 'CZ.41': 'Karlovarsky kraj', 'CZ.63': 'Kraj Vysocina', 'CZ.52': 'Kralovehradecky kraj', 'CZ.51': 'Liberecky kraj', 'CZ.80': 'Moravskoslezsky kraj', 'CZ.71': 'Olomoucky kraj', 'CZ.53': 'Pardubicky kraj', 'CZ.32': 'Plzensky kraj', 'CZ.10': 'Praha, Hlavni mesto', 'CZ.20': 'Stredocesky kraj', 'CZ.42': 'Ustecky kraj', 'CZ.72': 'Zlinsky kraj',
			},
			'DE': {
				'DE.BW': 'Baden-Wurttemberg', 'DE.BY': 'Bayern', 'DE.BE': 'Berlin', 'DE.BB': 'Brandenburg', 'DE.HB': 'Bremen', 'DE.HH': 'Hamburg', 'DE.HE': 'Hessen', 'DE.MV': 'Mecklenburg-Vorpommern', 'DE.NI': 'Niedersachsen', 'DE.NW': 'Nordrhein-Westfalen', 'DE.RP': 'Rheinland-Pfalz', 'DE.SL': 'Saarland', 'DE.SN': 'Sachsen', 'DE.ST': 'Sachsen-Anhalt', 'DE.SH': 'Schleswig-Holstein', 'DE.TH': 'Thuringen',
			},
			'DJ': {
				'DJ.DJ': 'Djibouti',
			},
			'DK': {
				'DK.84': 'Hovedstaden', 'DK.82': 'Midtjylland', 'DK.81': 'Nordjylland', 'DK.85': 'Sjaelland', 'DK.83': 'Syddanmark',
			},
			'DM': {
				'DM.02': 'Saint Andrew', 'DM.04': 'Saint George', 'DM.05': 'Saint John', 'DM.08': 'Saint Mark', 'DM.10': 'Saint Paul',
			},
			'DO': {
				'DO.02': 'Azua', 'DO.03': 'Baoruco', 'DO.04': 'Barahona', 'DO.05': 'Dajabon', 'DO.01': 'Distrito Nacional (Santo Domingo)', 'DO.06': 'Duarte', 'DO.08': 'El Seibo', 'DO.09': 'Espaillat', 'DO.30': 'Hato Mayor', 'DO.19': 'Hermanas Mirabal', 'DO.10': 'Independencia', 'DO.11': 'La Altagracia', 'DO.12': 'La Romana', 'DO.13': 'La Vega', 'DO.14': 'Maria Trinidad Sanchez', 'DO.28': 'Monsenor Nouel', 'DO.15': 'Monte Cristi', 'DO.29': 'Monte Plata', 'DO.16': 'Pedernales', 'DO.17': 'Peravia', 'DO.18': 'Puerto Plata', 'DO.20': 'Samana', 'DO.21': 'San Cristobal', 'DO.31': 'San Jose de Ocoa', 'DO.22': 'San Juan', 'DO.23': 'San Pedro de Macoris', 'DO.24': 'Sanchez Ramirez', 'DO.25': 'Santiago', 'DO.26': 'Santiago Rodriguez', 'DO.27': 'Valverde',
			},
			'DZ': {
				'DZ.01': 'Adrar', 'DZ.44': 'Ain Defla', 'DZ.46': 'Ain Temouchent', 'DZ.16': 'Alger', 'DZ.23': 'Annaba', 'DZ.05': 'Batna', 'DZ.08': 'Bechar', 'DZ.06': 'Bejaia', 'DZ.07': 'Biskra', 'DZ.09': 'Blida', 'DZ.34': 'Bordj Bou Arreridj', 'DZ.10': 'Bouira', 'DZ.35': 'Boumerdes', 'DZ.02': 'Chlef', 'DZ.25': 'Constantine', 'DZ.17': 'Djelfa', 'DZ.32': 'El Bayadh', 'DZ.39': 'El Oued', 'DZ.36': 'El Tarf', 'DZ.47': 'Ghardaia', 'DZ.24': 'Guelma', 'DZ.33': 'Illizi', 'DZ.18': 'Jijel', 'DZ.40': 'Khenchela', 'DZ.03': 'Laghouat', 'DZ.28': 'M\'sila', 'DZ.29': 'Mascara', 'DZ.26': 'Medea', 'DZ.43': 'Mila', 'DZ.27': 'Mostaganem', 'DZ.45': 'Naama', 'DZ.31': 'Oran', 'DZ.30': 'Ouargla', 'DZ.04': 'Oum el Bouaghi', 'DZ.48': 'Relizane', 'DZ.20': 'Saida', 'DZ.19': 'Setif', 'DZ.22': 'Sidi Bel Abbes', 'DZ.21': 'Skikda', 'DZ.41': 'Souk Ahras', 'DZ.11': 'Tamanrasset', 'DZ.12': 'Tebessa', 'DZ.14': 'Tiaret', 'DZ.37': 'Tindouf', 'DZ.42': 'Tipaza', 'DZ.38': 'Tissemsilt', 'DZ.15': 'Tizi Ouzou', 'DZ.13': 'Tlemcen',
			},
			'EC': {
				'EC.A': 'Azuay', 'EC.B': 'Bolivar', 'EC.F': 'Canar', 'EC.C': 'Carchi', 'EC.H': 'Chimborazo', 'EC.X': 'Cotopaxi', 'EC.O': 'El Oro', 'EC.E': 'Esmeraldas', 'EC.W': 'Galapagos', 'EC.G': 'Guayas', 'EC.I': 'Imbabura', 'EC.L': 'Loja', 'EC.R': 'Los Rios', 'EC.M': 'Manabi', 'EC.S': 'Morona Santiago', 'EC.N': 'Napo', 'EC.D': 'Orellana', 'EC.Y': 'Pastaza', 'EC.P': 'Pichincha', 'EC.SE': 'Santa Elena', 'EC.SD': 'Santo Domingo de los Tsachilas', 'EC.U': 'Sucumbios', 'EC.T': 'Tungurahua', 'EC.Z': 'Zamora Chinchipe',
			},
			'EE': {
				'EE.37': 'Harjumaa', 'EE.39': 'Hiiumaa', 'EE.44': 'Ida-Virumaa', 'EE.51': 'Jarvamaa', 'EE.49': 'Jogevamaa', 'EE.59': 'Laane-Virumaa', 'EE.57': 'Laanemaa', 'EE.67': 'Parnumaa', 'EE.65': 'Polvamaa', 'EE.70': 'Raplamaa', 'EE.74': 'Saaremaa', 'EE.78': 'Tartumaa', 'EE.82': 'Valgamaa', 'EE.84': 'Viljandimaa', 'EE.86': 'Vorumaa',
			},
			'EG': {
				'EG.DK': 'Ad Daqahliyah', 'EG.BA': 'Al Bahr al Ahmar', 'EG.BH': 'Al Buhayrah', 'EG.FYM': 'Al Fayyum', 'EG.GH': 'Al Gharbiyah', 'EG.ALX': 'Al Iskandariyah', 'EG.IS': 'Al Isma\'iliyah', 'EG.GZ': 'Al Jizah', 'EG.MNF': 'Al Minufiyah', 'EG.MN': 'Al Minya', 'EG.C': 'Al Qahirah', 'EG.KB': 'Al Qalyubiyah', 'EG.LX': 'Al Uqsur', 'EG.WAD': 'Al Wadi al Jadid', 'EG.SUZ': 'As Suways', 'EG.SHR': 'Ash Sharqiyah', 'EG.ASN': 'Aswan', 'EG.AST': 'Asyut', 'EG.BNS': 'Bani Suwayf', 'EG.PTS': 'Bur Sa\'id', 'EG.DT': 'Dumyat', 'EG.JS': 'Janub Sina\'', 'EG.KFS': 'Kafr ash Shaykh', 'EG.MT': 'Matruh', 'EG.KN': 'Qina', 'EG.SIN': 'Shamal Sina\'', 'EG.SHG': 'Suhaj',
			},
			'ER': {
				'ER.MA': 'Al Awsat',
			},
			'ES': {
				'ES.AN': 'Andalucia', 'ES.AR': 'Aragon', 'ES.AS': 'Asturias, Principado de', 'ES.CN': 'Canarias', 'ES.CB': 'Cantabria', 'ES.CL': 'Castilla y Leon', 'ES.CM': 'Castilla-La Mancha', 'ES.CT': 'Catalunya', 'ES.CE': 'Ceuta', 'ES.EX': 'Extremadura', 'ES.GA': 'Galicia', 'ES.IB': 'Illes Balears', 'ES.RI': 'La Rioja', 'ES.MD': 'Madrid, Comunidad de', 'ES.ML': 'Melilla', 'ES.MC': 'Murcia, Region de', 'ES.NC': 'Navarra, Comunidad Foral de', 'ES.PV': 'Pais Vasco', 'ES.VC': 'Valenciana, Comunidad',
			},
			'ET': {
				'ET.AA': 'Adis Abeba', 'ET.AF': 'Afar', 'ET.AM': 'Amara', 'ET.BE': 'Binshangul Gumuz', 'ET.DD': 'Dire Dawa', 'ET.HA': 'Hareri Hizb', 'ET.OR': 'Oromiya', 'ET.SO': 'Sumale', 'ET.TI': 'Tigray', 'ET.SN': 'YeDebub Biheroch Bihereseboch na Hizboch',
			},
			'FI': {
				'FI.02': 'Etela-Karjala', 'FI.03': 'Etela-Pohjanmaa', 'FI.04': 'Etela-Savo', 'FI.05': 'Kainuu', 'FI.06': 'Kanta-Hame', 'FI.07': 'Keski-Pohjanmaa', 'FI.08': 'Keski-Suomi', 'FI.09': 'Kymenlaakso', 'FI.10': 'Lappi', 'FI.16': 'Paijat-Hame', 'FI.11': 'Pirkanmaa', 'FI.12': 'Pohjanmaa', 'FI.13': 'Pohjois-Karjala', 'FI.14': 'Pohjois-Pohjanmaa', 'FI.15': 'Pohjois-Savo', 'FI.17': 'Satakunta', 'FI.18': 'Uusimaa', 'FI.19': 'Varsinais-Suomi',
			},
			'FJ': {
				'FJ.C': 'Central', 'FJ.E': 'Eastern', 'FJ.N': 'Northern', 'FJ.W': 'Western',
			},
			'FM': {
				'FM.TRK': 'Chuuk', 'FM.KSA': 'Kosrae', 'FM.PNI': 'Pohnpei', 'FM.YAP': 'Yap',
			},
			'FR': {
				'FR.ARA': 'Auvergne-Rhone-Alpes', 'FR.BFC': 'Bourgogne-Franche-Comte', 'FR.BRE': 'Bretagne', 'FR.CVL': 'Centre-Val de Loire', 'FR.COR': 'Corse', 'FR.GES': 'Grand-Est', 'FR.HDF': 'Hauts-de-France', 'FR.IDF': 'Ile-de-France', 'FR.NOR': 'Normandie', 'FR.NAQ': 'Nouvelle-Aquitaine', 'FR.OCC': 'Occitanie', 'FR.PDL': 'Pays-de-la-Loire', 'FR.PAC': 'Provence-Alpes-Cote-d\'Azur',
			},
			'GA': {
				'GA.1': 'Estuaire', 'GA.2': 'Haut-Ogooue', 'GA.3': 'Moyen-Ogooue', 'GA.4': 'Ngounie', 'GA.6': 'Ogooue-Ivindo', 'GA.8': 'Ogooue-Maritime', 'GA.9': 'Woleu-Ntem',
			},
			'GB': {
				'GB.ENG': 'England', 'GB.NIR': 'Northern Ireland', 'GB.SCT': 'Scotland', 'GB.WLS': 'Wales',
			},
			'GD': {
				'GD.01': 'Saint Andrew', 'GD.02': 'Saint David', 'GD.03': 'Saint George', 'GD.04': 'Saint John', 'GD.05': 'Saint Mark', 'GD.06': 'Saint Patrick', 'GD.10': 'Southern Grenadine Islands',
			},
			'GE': {
				'GE.AB': 'Abkhazia', 'GE.AJ': 'Ajaria', 'GE.GU': 'Guria', 'GE.IM': 'Imereti', 'GE.KA': 'K\'akheti', 'GE.KK': 'Kvemo Kartli', 'GE.MM': 'Mtskheta-Mtianeti', 'GE.RL': 'Rach\'a-Lechkhumi-Kvemo Svaneti', 'GE.SZ': 'Samegrelo-Zemo Svaneti', 'GE.SJ': 'Samtskhe-Javakheti', 'GE.SK': 'Shida Kartli', 'GE.TB': 'Tbilisi',
			},
			'GH': {
				'GH.AH': 'Ashanti', 'GH.BA': 'Brong-Ahafo', 'GH.CP': 'Central', 'GH.EP': 'Eastern', 'GH.AA': 'Greater Accra', 'GH.NP': 'Northern', 'GH.UE': 'Upper East', 'GH.TV': 'Volta', 'GH.WP': 'Western',
			},
			'GL': {
				'GL.AV': 'Avannaata Kommunia', 'GL.KU': 'Kommune Kujalleq', 'GL.QT': 'Kommune Qeqertalik', 'GL.SM': 'Kommuneqarfik Sermersooq', 'GL.QE': 'Qeqqata Kommunia',
			},
			'GM': {
				'GM.B': 'Banjul', 'GM.M': 'Central River', 'GM.L': 'Lower River', 'GM.N': 'North Bank', 'GM.U': 'Upper River', 'GM.W': 'Western',
			},
			'GN': {
				'GN.BF': 'Boffa', 'GN.B': 'Boke', 'GN.C': 'Conakry', 'GN.CO': 'Coyah', 'GN.DB': 'Dabola', 'GN.DL': 'Dalaba', 'GN.DU': 'Dubreka', 'GN.K': 'Kankan', 'GN.KS': 'Kissidougou', 'GN.L': 'Labe', 'GN.MC': 'Macenta', 'GN.N': 'Nzerekore', 'GN.PI': 'Pita', 'GN.SI': 'Siguiri',
			},
			'GQ': {
				'GQ.BN': 'Bioko Norte', 'GQ.BS': 'Bioko Sur', 'GQ.LI': 'Litoral', 'GQ.WN': 'Wele-Nzas',
			},
			'GR': {
				'GR.69': 'Agion Oros', 'GR.A': 'Anatoliki Makedonia kai Thraki', 'GR.I': 'Attiki', 'GR.G': 'Dytiki Ellada', 'GR.C': 'Dytiki Makedonia', 'GR.F': 'Ionia Nisia', 'GR.D': 'Ipeiros', 'GR.B': 'Kentriki Makedonia', 'GR.M': 'Kriti', 'GR.L': 'Notio Aigaio', 'GR.J': 'Peloponnisos', 'GR.H': 'Sterea Ellada', 'GR.E': 'Thessalia', 'GR.K': 'Voreio Aigaio',
			},
			'GT': {
				'GT.AV': 'Alta Verapaz', 'GT.BV': 'Baja Verapaz', 'GT.CM': 'Chimaltenango', 'GT.CQ': 'Chiquimula', 'GT.PR': 'El Progreso', 'GT.ES': 'Escuintla', 'GT.GU': 'Guatemala', 'GT.HU': 'Huehuetenango', 'GT.IZ': 'Izabal', 'GT.JA': 'Jalapa', 'GT.JU': 'Jutiapa', 'GT.PE': 'Peten', 'GT.QZ': 'Quetzaltenango', 'GT.QC': 'Quiche', 'GT.RE': 'Retalhuleu', 'GT.SA': 'Sacatepequez', 'GT.SM': 'San Marcos', 'GT.SR': 'Santa Rosa', 'GT.SO': 'Solola', 'GT.SU': 'Suchitepequez', 'GT.TO': 'Totonicapan', 'GT.ZA': 'Zacapa',
			},
			'GW': {
				'GW.BS': 'Bissau', 'GW.GA': 'Gabu',
			},
			'GY': {
				'GY.DE': 'Demerara-Mahaica', 'GY.EB': 'East Berbice-Corentyne', 'GY.ES': 'Essequibo Islands-West Demerara', 'GY.PM': 'Pomeroon-Supenaam', 'GY.UD': 'Upper Demerara-Berbice',
			},
			'HN': {
				'HN.AT': 'Atlantida', 'HN.CH': 'Choluteca', 'HN.CL': 'Colon', 'HN.CM': 'Comayagua', 'HN.CP': 'Copan', 'HN.CR': 'Cortes', 'HN.EP': 'El Paraiso', 'HN.FM': 'Francisco Morazan', 'HN.IN': 'Intibuca', 'HN.IB': 'Islas de la Bahia', 'HN.LP': 'La Paz', 'HN.LE': 'Lempira', 'HN.OC': 'Ocotepeque', 'HN.OL': 'Olancho', 'HN.SB': 'Santa Barbara', 'HN.VA': 'Valle', 'HN.YO': 'Yoro',
			},
			'HR': {
				'HR.07': 'Bjelovarsko-bilogorska zupanija', 'HR.12': 'Brodsko-posavska zupanija', 'HR.19': 'Dubrovacko-neretvanska zupanija', 'HR.21': 'Grad Zagreb', 'HR.18': 'Istarska zupanija', 'HR.04': 'Karlovacka zupanija', 'HR.06': 'Koprivnicko-krizevacka zupanija', 'HR.02': 'Krapinsko-zagorska zupanija', 'HR.09': 'Licko-senjska zupanija', 'HR.20': 'Medimurska zupanija', 'HR.14': 'Osjecko-baranjska zupanija', 'HR.11': 'Pozesko-slavonska zupanija', 'HR.08': 'Primorsko-goranska zupanija', 'HR.15': 'Sibensko-kninska zupanija', 'HR.03': 'Sisacko-moslavacka zupanija', 'HR.17': 'Splitsko-dalmatinska zupanija', 'HR.05': 'Varazdinska zupanija', 'HR.10': 'Viroviticko-podravska zupanija', 'HR.16': 'Vukovarsko-srijemska zupanija', 'HR.13': 'Zadarska zupanija', 'HR.01': 'Zagrebacka zupanija',
			},
			'HT': {
				'HT.AR': 'Artibonite', 'HT.CE': 'Centre', 'HT.ND': 'Nord', 'HT.NE': 'Nord-Est', 'HT.OU': 'Ouest', 'HT.SD': 'Sud', 'HT.SE': 'Sud-Est',
			},
			'HU': {
				'HU.BK': 'Bacs-Kiskun', 'HU.BA': 'Baranya', 'HU.BE': 'Bekes', 'HU.BZ': 'Borsod-Abauj-Zemplen', 'HU.BU': 'Budapest', 'HU.CS': 'Csongrad', 'HU.FE': 'Fejer', 'HU.GS': 'Gyor-Moson-Sopron', 'HU.HB': 'Hajdu-Bihar', 'HU.HE': 'Heves', 'HU.JN': 'Jasz-Nagykun-Szolnok', 'HU.KE': 'Komarom-Esztergom', 'HU.NO': 'Nograd', 'HU.PE': 'Pest', 'HU.SO': 'Somogy', 'HU.SZ': 'Szabolcs-Szatmar-Bereg', 'HU.TO': 'Tolna', 'HU.VA': 'Vas', 'HU.VE': 'Veszprem', 'HU.ZA': 'Zala',
			},
			'ID': {
				'ID.AC': 'Aceh', 'ID.BA': 'Bali', 'ID.BT': 'Banten', 'ID.BE': 'Bengkulu', 'ID.GO': 'Gorontalo', 'ID.JK': 'Jakarta Raya', 'ID.JA': 'Jambi', 'ID.JB': 'Jawa Barat', 'ID.JT': 'Jawa Tengah', 'ID.JI': 'Jawa Timur', 'ID.KB': 'Kalimantan Barat', 'ID.KS': 'Kalimantan Selatan', 'ID.KT': 'Kalimantan Tengah', 'ID.KI': 'Kalimantan Timur', 'ID.KU': 'Kalimantan Utara', 'ID.BB': 'Kepulauan Bangka Belitung', 'ID.KR': 'Kepulauan Riau', 'ID.LA': 'Lampung', 'ID.ML': 'Maluku', 'ID.MU': 'Maluku Utara', 'ID.NB': 'Nusa Tenggara Barat', 'ID.NT': 'Nusa Tenggara Timur', 'ID.PP': 'Papua', 'ID.PB': 'Papua Barat', 'ID.RI': 'Riau', 'ID.SR': 'Sulawesi Barat', 'ID.SN': 'Sulawesi Selatan', 'ID.ST': 'Sulawesi Tengah', 'ID.SG': 'Sulawesi Tenggara', 'ID.SA': 'Sulawesi Utara', 'ID.SB': 'Sumatera Barat', 'ID.SS': 'Sumatera Selatan', 'ID.SU': 'Sumatera Utara', 'ID.YO': 'Yogyakarta',
			},
			'IE': {
				'IE.CW': 'Carlow', 'IE.CN': 'Cavan', 'IE.CE': 'Clare', 'IE.CO': 'Cork', 'IE.DL': 'Donegal', 'IE.D': 'Dublin', 'IE.G': 'Galway', 'IE.KY': 'Kerry', 'IE.KE': 'Kildare', 'IE.KK': 'Kilkenny', 'IE.LS': 'Laois', 'IE.LM': 'Leitrim', 'IE.LK': 'Limerick', 'IE.LD': 'Longford', 'IE.LH': 'Louth', 'IE.MO': 'Mayo', 'IE.MH': 'Meath', 'IE.MN': 'Monaghan', 'IE.OY': 'Offaly', 'IE.RN': 'Roscommon', 'IE.SO': 'Sligo', 'IE.TA': 'Tipperary', 'IE.WD': 'Waterford', 'IE.WH': 'Westmeath', 'IE.WX': 'Wexford', 'IE.WW': 'Wicklow',
			},
			'IL': {
				'IL.D': 'HaDarom', 'IL.M': 'HaMerkaz', 'IL.Z': 'HaTsafon', 'IL.HA': 'Hefa', 'IL.TA': 'Tel Aviv', 'IL.JM': 'Yerushalayim',
			},
			'IN': {
				'IN.AN': 'Andaman and Nicobar Islands', 'IN.AP': 'Andhra Pradesh', 'IN.AR': 'Arunachal Pradesh', 'IN.AS': 'Assam', 'IN.BR': 'Bihar', 'IN.CH': 'Chandigarh', 'IN.CT': 'Chhattisgarh', 'IN.DN': 'Dadra and Nagar Haveli', 'IN.DD': 'Daman and Diu', 'IN.DL': 'Delhi', 'IN.GA': 'Goa', 'IN.GJ': 'Gujarat', 'IN.HR': 'Haryana', 'IN.HP': 'Himachal Pradesh', 'IN.JK': 'Jammu and Kashmir', 'IN.JH': 'Jharkhand', 'IN.KA': 'Karnataka', 'IN.KL': 'Kerala', 'IN.MP': 'Madhya Pradesh', 'IN.MH': 'Maharashtra', 'IN.MN': 'Manipur', 'IN.ML': 'Meghalaya', 'IN.MZ': 'Mizoram', 'IN.NL': 'Nagaland', 'IN.OR': 'Odisha', 'IN.PY': 'Puducherry', 'IN.PB': 'Punjab', 'IN.RJ': 'Rajasthan', 'IN.SK': 'Sikkim', 'IN.TN': 'Tamil Nadu', 'IN.TG': 'Telangana', 'IN.TR': 'Tripura', 'IN.UP': 'Uttar Pradesh', 'IN.UT': 'Uttarakhand', 'IN.WB': 'West Bengal',
			},
			'IQ': {
				'IQ.AN': 'Al Anbar', 'IQ.BA': 'Al Basrah', 'IQ.MU': 'Al Muthanna', 'IQ.QA': 'Al Qadisiyah', 'IQ.NA': 'An Najaf', 'IQ.AR': 'Arbil', 'IQ.SU': 'As Sulaymaniyah', 'IQ.BB': 'Babil', 'IQ.BG': 'Baghdad', 'IQ.DA': 'Dahuk', 'IQ.DQ': 'Dhi Qar', 'IQ.DI': 'Diyala', 'IQ.KA': 'Karbala\'', 'IQ.KI': 'Kirkuk', 'IQ.MA': 'Maysan', 'IQ.NI': 'Ninawa', 'IQ.SD': 'Salah ad Din', 'IQ.WA': 'Wasit',
			},
			'IR': {
				'IR.32': 'Alborz', 'IR.03': 'Ardabil', 'IR.02': 'Azarbayjan-e Gharbi', 'IR.01': 'Azarbayjan-e Sharqi', 'IR.06': 'Bushehr', 'IR.08': 'Chahar Mahal va Bakhtiari', 'IR.04': 'Esfahan', 'IR.14': 'Fars', 'IR.19': 'Gilan', 'IR.27': 'Golestan', 'IR.24': 'Hamadan', 'IR.23': 'Hormozgan', 'IR.05': 'Ilam', 'IR.15': 'Kerman', 'IR.17': 'Kermanshah', 'IR.29': 'Khorasan-e Jonubi', 'IR.30': 'Khorasan-e Razavi', 'IR.31': 'Khorasan-e Shomali', 'IR.10': 'Khuzestan', 'IR.18': 'Kohgiluyeh va Bowyer Ahmad', 'IR.16': 'Kordestan', 'IR.20': 'Lorestan', 'IR.22': 'Markazi', 'IR.21': 'Mazandaran', 'IR.28': 'Qazvin', 'IR.26': 'Qom', 'IR.12': 'Semnan', 'IR.13': 'Sistan va Baluchestan', 'IR.07': 'Tehran', 'IR.25': 'Yazd', 'IR.11': 'Zanjan',
			},
			'IS': {
				'IS.7': 'Austurland', 'IS.1': 'Hofudborgarsvaedi', 'IS.6': 'Nordurland eystra', 'IS.5': 'Nordurland vestra', 'IS.8': 'Sudurland', 'IS.2': 'Sudurnes', 'IS.4': 'Vestfirdir', 'IS.3': 'Vesturland',
			},
			'IT': {
				'IT.65': 'Abruzzo', 'IT.77': 'Basilicata', 'IT.78': 'Calabria', 'IT.72': 'Campania', 'IT.45': 'Emilia-Romagna', 'IT.36': 'Friuli-Venezia Giulia', 'IT.62': 'Lazio', 'IT.42': 'Liguria', 'IT.25': 'Lombardia', 'IT.57': 'Marche', 'IT.67': 'Molise', 'IT.21': 'Piemonte', 'IT.75': 'Puglia', 'IT.88': 'Sardegna', 'IT.82': 'Sicilia', 'IT.52': 'Toscana', 'IT.32': 'Trentino-Alto Adige', 'IT.55': 'Umbria', 'IT.23': 'Valle d\'Aosta', 'IT.34': 'Veneto',
			},
			'JM': {
				'JM.13': 'Clarendon', 'JM.09': 'Hanover', 'JM.01': 'Kingston', 'JM.12': 'Manchester', 'JM.04': 'Portland', 'JM.02': 'Saint Andrew', 'JM.06': 'Saint Ann', 'JM.14': 'Saint Catherine', 'JM.11': 'Saint Elizabeth', 'JM.08': 'Saint James', 'JM.05': 'Saint Mary', 'JM.03': 'Saint Thomas', 'JM.07': 'Trelawny', 'JM.10': 'Westmoreland',
			},
			'JO': {
				'JO.AJ': '\'Ajlun', 'JO.AQ': 'Al \'Aqabah', 'JO.AM': 'Al \'Asimah', 'JO.BA': 'Al Balqa\'', 'JO.KA': 'Al Karak', 'JO.MA': 'Al Mafraq', 'JO.AT': 'At Tafilah', 'JO.AZ': 'Az Zarqa\'', 'JO.IR': 'Irbid', 'JO.JA': 'Jarash', 'JO.MN': 'Ma\'an', 'JO.MD': 'Madaba',
			},
			'JP': {
				'JP.23': 'Aichi', 'JP.05': 'Akita', 'JP.02': 'Aomori', 'JP.12': 'Chiba', 'JP.38': 'Ehime', 'JP.18': 'Fukui', 'JP.40': 'Fukuoka', 'JP.07': 'Fukushima', 'JP.21': 'Gifu', 'JP.10': 'Gunma', 'JP.34': 'Hiroshima', 'JP.01': 'Hokkaido', 'JP.28': 'Hyogo', 'JP.08': 'Ibaraki', 'JP.17': 'Ishikawa', 'JP.03': 'Iwate', 'JP.37': 'Kagawa', 'JP.46': 'Kagoshima', 'JP.14': 'Kanagawa', 'JP.39': 'Kochi', 'JP.43': 'Kumamoto', 'JP.26': 'Kyoto', 'JP.24': 'Mie', 'JP.04': 'Miyagi', 'JP.45': 'Miyazaki', 'JP.20': 'Nagano', 'JP.42': 'Nagasaki', 'JP.29': 'Nara', 'JP.15': 'Niigata', 'JP.44': 'Oita', 'JP.33': 'Okayama', 'JP.47': 'Okinawa', 'JP.27': 'Osaka', 'JP.41': 'Saga', 'JP.11': 'Saitama', 'JP.25': 'Shiga', 'JP.32': 'Shimane', 'JP.22': 'Shizuoka', 'JP.09': 'Tochigi', 'JP.36': 'Tokushima', 'JP.13': 'Tokyo', 'JP.31': 'Tottori', 'JP.16': 'Toyama', 'JP.30': 'Wakayama', 'JP.06': 'Yamagata', 'JP.35': 'Yamaguchi', 'JP.19': 'Yamanashi',
			},
			'KE': {
				'KE.01': 'Baringo', 'KE.02': 'Bomet', 'KE.03': 'Bungoma', 'KE.04': 'Busia', 'KE.05': 'Elgeyo/Marakwet', 'KE.06': 'Embu', 'KE.07': 'Garissa', 'KE.08': 'Homa Bay', 'KE.09': 'Isiolo', 'KE.10': 'Kajiado', 'KE.11': 'Kakamega', 'KE.12': 'Kericho', 'KE.13': 'Kiambu', 'KE.14': 'Kilifi', 'KE.15': 'Kirinyaga', 'KE.16': 'Kisii', 'KE.17': 'Kisumu', 'KE.18': 'Kitui', 'KE.19': 'Kwale', 'KE.20': 'Laikipia', 'KE.21': 'Lamu', 'KE.22': 'Machakos', 'KE.23': 'Makueni', 'KE.24': 'Mandera', 'KE.25': 'Marsabit', 'KE.26': 'Meru', 'KE.27': 'Migori', 'KE.28': 'Mombasa', 'KE.29': 'Murang\'a', 'KE.30': 'Nairobi City', 'KE.31': 'Nakuru', 'KE.32': 'Nandi', 'KE.33': 'Narok', 'KE.34': 'Nyamira', 'KE.35': 'Nyandarua', 'KE.36': 'Nyeri', 'KE.38': 'Siaya', 'KE.39': 'Taita/Taveta', 'KE.41': 'Tharaka-Nithi', 'KE.42': 'Trans Nzoia', 'KE.43': 'Turkana', 'KE.44': 'Uasin Gishu', 'KE.46': 'Wajir',
			},
			'KG': {
				'KG.B': 'Batken', 'KG.GB': 'Bishkek', 'KG.C': 'Chuy', 'KG.J': 'Jalal-Abad', 'KG.N': 'Naryn', 'KG.GO': 'Osh', 'KG.T': 'Talas', 'KG.Y': 'Ysyk-Kol',
			},
			'KH': {
				'KH.2': 'Baat Dambang', 'KH.1': 'Banteay Mean Chey', 'KH.3': 'Kampong Chaam', 'KH.4': 'Kampong Chhnang', 'KH.5': 'Kampong Spueu', 'KH.6': 'Kampong Thum', 'KH.7': 'Kampot', 'KH.8': 'Kandaal', 'KH.10': 'Kracheh', 'KH.23': 'Krong Kaeb', 'KH.24': 'Krong Pailin', 'KH.18': 'Krong Preah Sihanouk', 'KH.11': 'Mondol Kiri', 'KH.12': 'Phnom Penh', 'KH.15': 'Pousaat', 'KH.14': 'Prey Veaeng', 'KH.16': 'Rotanak Kiri', 'KH.17': 'Siem Reab', 'KH.19': 'Stueng Traeng', 'KH.20': 'Svaay Rieng', 'KH.21': 'Taakaev',
			},
			'KI': {
				'KI.G': 'Gilbert Islands', 'KI.L': 'Line Islands',
			},
			'KM': {
				'KM.G': 'Grande Comore',
			},
			'KN': {
				'KN.02': 'Saint Anne Sandy Point', 'KN.03': 'Saint George Basseterre', 'KN.05': 'Saint James Windward', 'KN.06': 'Saint John Capisterre', 'KN.07': 'Saint John Figtree', 'KN.08': 'Saint Mary Cayon', 'KN.09': 'Saint Paul Capisterre', 'KN.10': 'Saint Paul Charlestown', 'KN.11': 'Saint Peter Basseterre', 'KN.12': 'Saint Thomas Lowland', 'KN.13': 'Saint Thomas Middle Island',
			},
			'KP': {
				'KP.01': 'P\'yongyang',
			},
			'KR': {
				'KR.26': 'Busan-gwangyeoksi', 'KR.43': 'Chungcheongbuk-do', 'KR.44': 'Chungcheongnam-do', 'KR.27': 'Daegu-gwangyeoksi', 'KR.30': 'Daejeon-gwangyeoksi', 'KR.42': 'Gangwon-do', 'KR.29': 'Gwangju-gwangyeoksi', 'KR.41': 'Gyeonggi-do', 'KR.47': 'Gyeongsangbuk-do', 'KR.48': 'Gyeongsangnam-do', 'KR.28': 'Incheon-gwangyeoksi', 'KR.49': 'Jeju-teukbyeoljachido', 'KR.45': 'Jeollabuk-do', 'KR.46': 'Jeollanam-do', 'KR.11': 'Seoul-teukbyeolsi', 'KR.31': 'Ulsan-gwangyeoksi',
			},
			'KW': {
				'KW.KU': 'Al \'Asimah', 'KW.AH': 'Al Ahmadi', 'KW.FA': 'Al Farwaniyah', 'KW.JA': 'Al Jahra\'', 'KW.HA': 'Hawalli', 'KW.MU': 'Mubarak al Kabir',
			},
			'KZ': {
				'KZ.ALA': 'Almaty', 'KZ.ALM': 'Almaty oblysy', 'KZ.AKM': 'Aqmola oblysy', 'KZ.AKT': 'Aqtobe oblysy', 'KZ.AST': 'Astana', 'KZ.ATY': 'Atyrau oblysy', 'KZ.ZAP': 'Batys Qazaqstan oblysy', 'KZ.BAY': 'Bayqongyr', 'KZ.MAN': 'Mangghystau oblysy', 'KZ.YUZ': 'Ongtustik Qazaqstan oblysy', 'KZ.PAV': 'Pavlodar oblysy', 'KZ.KAR': 'Qaraghandy oblysy', 'KZ.KUS': 'Qostanay oblysy', 'KZ.KZY': 'Qyzylorda oblysy', 'KZ.VOS': 'Shyghys Qazaqstan oblysy', 'KZ.SEV': 'Soltustik Qazaqstan oblysy', 'KZ.ZHA': 'Zhambyl oblysy',
			},
			'LA': {
				'LA.BL': 'Bolikhamxai', 'LA.CH': 'Champasak', 'LA.HO': 'Houaphan', 'LA.KH': 'Khammouan', 'LA.LM': 'Louang Namtha', 'LA.LP': 'Louangphabang', 'LA.OU': 'Oudomxai', 'LA.SV': 'Savannakhet', 'LA.VI': 'Viangchan', 'LA.XA': 'Xaignabouli', 'LA.XI': 'Xiangkhouang',
			},
			'LB': {
				'LB.AK': 'Aakkar', 'LB.BH': 'Baalbek-Hermel', 'LB.BI': 'Beqaa', 'LB.BA': 'Beyrouth', 'LB.AS': 'Liban-Nord', 'LB.JA': 'Liban-Sud', 'LB.JL': 'Mont-Liban', 'LB.NA': 'Nabatiye',
			},
			'LC': {
				'LC.01': 'Anse la Raye', 'LC.02': 'Castries', 'LC.05': 'Dennery', 'LC.06': 'Gros Islet', 'LC.07': 'Laborie', 'LC.08': 'Micoud', 'LC.10': 'Soufriere', 'LC.11': 'Vieux Fort',
			},
			'LI': {
				'LI.01': 'Balzers', 'LI.02': 'Eschen', 'LI.03': 'Gamprin', 'LI.04': 'Mauren', 'LI.05': 'Planken', 'LI.06': 'Ruggell', 'LI.07': 'Schaan', 'LI.08': 'Schellenberg', 'LI.09': 'Triesen', 'LI.11': 'Vaduz',
			},
			'LK': {
				'LK.2': 'Central Province', 'LK.5': 'Eastern Province', 'LK.7': 'North Central Province', 'LK.6': 'North Western Province', 'LK.4': 'Northern Province', 'LK.9': 'Sabaragamuwa Province', 'LK.3': 'Southern Province', 'LK.8': 'Uva Province', 'LK.1': 'Western Province',
			},
			'LR': {
				'LR.GB': 'Grand Bassa', 'LR.GG': 'Grand Gedeh', 'LR.MG': 'Margibi', 'LR.MY': 'Maryland', 'LR.MO': 'Montserrado', 'LR.NI': 'Nimba', 'LR.SI': 'Sinoe',
			},
			'LS': {
				'LS.D': 'Berea', 'LS.C': 'Leribe', 'LS.A': 'Maseru', 'LS.G': 'Quthing',
			},
			'LT': {
				'LT.AL': 'Alytaus apskritis', 'LT.KU': 'Kauno apskritis', 'LT.KL': 'Klaipedos apskritis', 'LT.MR': 'Marijampoles apskritis', 'LT.PN': 'Panevezio apskritis', 'LT.SA': 'Siauliu apskritis', 'LT.TA': 'Taurages apskritis', 'LT.TE': 'Telsiu apskritis', 'LT.UT': 'Utenos apskritis', 'LT.VL': 'Vilniaus apskritis',
			},
			'LU': {
				'LU.DI': 'Diekirch', 'LU.GR': 'Grevenmacher', 'LU.LU': 'Luxembourg',
			},
			'LV': {
				'LV.011': 'Adazu novads', 'LV.001': 'Aglonas novads', 'LV.002': 'Aizkraukles novads', 'LV.003': 'Aizputes novads', 'LV.005': 'Alojas novads', 'LV.007': 'Aluksnes novads', 'LV.012': 'Babites novads', 'LV.013': 'Baldones novads', 'LV.015': 'Balvu novads', 'LV.016': 'Bauskas novads', 'LV.017': 'Beverinas novads', 'LV.018': 'Brocenu novads', 'LV.020': 'Carnikavas novads', 'LV.022': 'Cesu novads', 'LV.021': 'Cesvaines novads', 'LV.025': 'Daugavpils novads', 'LV.026': 'Dobeles novads', 'LV.027': 'Dundagas novads', 'LV.030': 'Erglu novads', 'LV.033': 'Gulbenes novads', 'LV.034': 'Iecavas novads', 'LV.035': 'Ikskiles novads', 'LV.037': 'Incukalna novads', 'LV.038': 'Jaunjelgavas novads', 'LV.039': 'Jaunpiebalgas novads', 'LV.040': 'Jaunpils novads', 'LV.042': 'Jekabpils novads', 'LV.JEL': 'Jelgava', 'LV.041': 'Jelgavas novads', 'LV.JUR': 'Jurmala', 'LV.052': 'Kekavas novads', 'LV.046': 'Kokneses novads', 'LV.047': 'Kraslavas novads', 'LV.050': 'Kuldigas novads', 'LV.053': 'Lielvardes novads', 'LV.LPX': 'Liepaja', 'LV.054': 'Limbazu novads', 'LV.056': 'Livanu novads', 'LV.057': 'Lubanas novads', 'LV.058': 'Ludzas novads', 'LV.059': 'Madonas novads', 'LV.061': 'Malpils novads', 'LV.064': 'Nauksenu novads', 'LV.067': 'Ogres novads', 'LV.068': 'Olaines novads', 'LV.069': 'Ozolnieku novads', 'LV.073': 'Preilu novads', 'LV.077': 'Rezeknes novads', 'LV.078': 'Riebinu novads', 'LV.RIX': 'Riga', 'LV.079': 'Rojas novads', 'LV.080': 'Ropazu novads', 'LV.082': 'Rugaju novads', 'LV.083': 'Rundales novads', 'LV.086': 'Salacgrivas novads', 'LV.087': 'Salaspils novads', 'LV.088': 'Saldus novads', 'LV.089': 'Saulkrastu novads', 'LV.090': 'Sejas novads', 'LV.091': 'Siguldas novads', 'LV.093': 'Skrundas novads', 'LV.095': 'Stopinu novads', 'LV.097': 'Talsu novads', 'LV.099': 'Tukuma novads', 'LV.101': 'Valkas novads', 'LV.VMR': 'Valmiera', 'LV.105': 'Vecumnieku novads', 'LV.106': 'Ventspils novads',
			},
			'LY': {
				'LY.BU': 'Al Butnan', 'LY.JA': 'Al Jabal al Akhdar', 'LY.JG': 'Al Jabal al Gharbi', 'LY.JU': 'Al Jufrah', 'LY.KF': 'Al Kufrah', 'LY.MJ': 'Al Marj', 'LY.MB': 'Al Marqab', 'LY.WA': 'Al Wahat', 'LY.NQ': 'An Nuqat al Khams', 'LY.ZA': 'Az Zawiyah', 'LY.BA': 'Banghazi', 'LY.DR': 'Darnah', 'LY.MI': 'Misratah', 'LY.MQ': 'Murzuq', 'LY.NL': 'Nalut', 'LY.SB': 'Sabha', 'LY.TB': 'Tarabulus',
			},
			'MA': {
				'MA.05': 'Beni-Mellal-Khenifra', 'MA.06': 'Casablanca-Settat', 'MA.08': 'Draa-Tafilalet', 'MA.03': 'Fes- Meknes', 'MA.10': 'Guelmim-Oued Noun (EH-partial)', 'MA.02': 'L\'Oriental', 'MA.11': 'Laayoune-Sakia El Hamra (EH-partial)', 'MA.07': 'Marrakech-Safi', 'MA.04': 'Rabat-Sale-Kenitra', 'MA.09': 'Souss-Massa', 'MA.01': 'Tanger-Tetouan-Al Hoceima',
			},
			'MC': {
				'MC.FO': 'Fontvieille', 'MC.CO': 'La Condamine', 'MC.MO': 'Monaco-Ville', 'MC.MC': 'Monte-Carlo', 'MC.SR': 'Saint-Roman',
			},
			'MD': {
				'MD.AN': 'Anenii Noi', 'MD.BA': 'Balti', 'MD.BS': 'Basarabeasca', 'MD.BD': 'Bender', 'MD.BR': 'Briceni', 'MD.CA': 'Cahul', 'MD.CL': 'Calarasi', 'MD.CT': 'Cantemir', 'MD.CS': 'Causeni', 'MD.CU': 'Chisinau', 'MD.CM': 'Cimislia', 'MD.CR': 'Criuleni', 'MD.DO': 'Donduseni', 'MD.DR': 'Drochia', 'MD.DU': 'Dubasari', 'MD.ED': 'Edinet', 'MD.FA': 'Falesti', 'MD.FL': 'Floresti', 'MD.GA': 'Gagauzia, Unitatea teritoriala autonoma', 'MD.GL': 'Glodeni', 'MD.HI': 'Hincesti', 'MD.IA': 'Ialoveni', 'MD.LE': 'Leova', 'MD.NI': 'Nisporeni', 'MD.OC': 'Ocnita', 'MD.OR': 'Orhei', 'MD.RE': 'Rezina', 'MD.RI': 'Riscani', 'MD.SI': 'Singerei', 'MD.SD': 'Soldanesti', 'MD.SO': 'Soroca', 'MD.SV': 'Stefan Voda', 'MD.SN': 'Stinga Nistrului, unitatea teritoriala din', 'MD.ST': 'Straseni', 'MD.TA': 'Taraclia', 'MD.TE': 'Telenesti', 'MD.UN': 'Ungheni',
			},
			'ME': {
				'ME.02': 'Bar', 'ME.03': 'Berane', 'ME.04': 'Bijelo Polje', 'ME.05': 'Budva', 'ME.06': 'Cetinje', 'ME.07': 'Danilovgrad', 'ME.08': 'Herceg-Novi', 'ME.09': 'Kolasin', 'ME.10': 'Kotor', 'ME.12': 'Niksic', 'ME.13': 'Plav', 'ME.14': 'Pljevlja', 'ME.15': 'Pluzine', 'ME.16': 'Podgorica', 'ME.17': 'Rozaje', 'ME.19': 'Tivat', 'ME.20': 'Ulcinj', 'ME.21': 'Zabljak',
			},
			'MG': {
				'MG.T': 'Antananarivo', 'MG.D': 'Antsiranana', 'MG.F': 'Fianarantsoa', 'MG.M': 'Mahajanga', 'MG.A': 'Toamasina', 'MG.U': 'Toliara',
			},
			'MH': {
				'MH.KWA': 'Kwajalein', 'MH.MAJ': 'Majuro',
			},
			'MK': {
				'MK.02': 'Aracinovo', 'MK.03': 'Berovo', 'MK.04': 'Bitola', 'MK.05': 'Bogdanci', 'MK.06': 'Bogovinje', 'MK.07': 'Bosilovo', 'MK.08': 'Brvenica', 'MK.78': 'Centar Zupa', 'MK.81': 'Cesinovo-Oblesevo', 'MK.21': 'Debar', 'MK.23': 'Delcevo', 'MK.25': 'Demir Hisar', 'MK.24': 'Demir Kapija', 'MK.26': 'Dojran', 'MK.27': 'Dolneni', 'MK.18': 'Gevgelija', 'MK.19': 'Gostivar', 'MK.34': 'Ilinden', 'MK.35': 'Jegunovce', 'MK.37': 'Karbinci', 'MK.36': 'Kavadarci', 'MK.40': 'Kicevo', 'MK.42': 'Kocani', 'MK.43': 'Kratovo', 'MK.44': 'Kriva Palanka', 'MK.45': 'Krivogastani', 'MK.46': 'Krusevo', 'MK.47': 'Kumanovo', 'MK.48': 'Lipkovo', 'MK.49': 'Lozovo', 'MK.51': 'Makedonska Kamenica', 'MK.52': 'Makedonski Brod', 'MK.54': 'Negotino', 'MK.56': 'Novo Selo', 'MK.58': 'Ohrid', 'MK.60': 'Pehcevo', 'MK.59': 'Petrovec', 'MK.61': 'Plasnica', 'MK.62': 'Prilep', 'MK.63': 'Probistip', 'MK.64': 'Radovis', 'MK.66': 'Resen', 'MK.67': 'Rosoman', 'MK.85': 'Skopje', 'MK.70': 'Sopiste', 'MK.71': 'Staro Nagoricane', 'MK.83': 'Stip', 'MK.72': 'Struga', 'MK.73': 'Strumica', 'MK.74': 'Studenicani', 'MK.69': 'Sveti Nikole', 'MK.75': 'Tearce', 'MK.76': 'Tetovo', 'MK.10': 'Valandovo', 'MK.13': 'Veles', 'MK.12': 'Vevcani', 'MK.14': 'Vinica', 'MK.16': 'Vrapciste', 'MK.32': 'Zelenikovo', 'MK.30': 'Zelino',
			},
			'ML': {
				'ML.BKO': 'Bamako', 'ML.7': 'Gao', 'ML.1': 'Kayes', 'ML.8': 'Kidal', 'ML.2': 'Koulikoro', 'ML.5': 'Mopti', 'ML.4': 'Segou', 'ML.3': 'Sikasso', 'ML.6': 'Tombouctou',
			},
			'MM': {
				'MM.07': 'Ayeyarwady', 'MM.02': 'Bago', 'MM.11': 'Kachin', 'MM.13': 'Kayin', 'MM.03': 'Magway', 'MM.04': 'Mandalay', 'MM.15': 'Mon', 'MM.18': 'Nay Pyi Taw', 'MM.01': 'Sagaing', 'MM.17': 'Shan', 'MM.05': 'Tanintharyi', 'MM.06': 'Yangon',
			},
			'MN': {
				'MN.071': 'Bayan-Olgiy', 'MN.037': 'Darhan uul', 'MN.063': 'Dornogovi', 'MN.057': 'Dzavhan', 'MN.065': 'Govi-Altay', 'MN.053': 'Omnogovi', 'MN.035': 'Orhon', 'MN.055': 'Ovorhangay', 'MN.049': 'Selenge', 'MN.047': 'Tov', 'MN.1': 'Ulaanbaatar',
			},
			'MR': {
				'MR.08': 'Dakhlet Nouadhibou', 'MR.14': 'Nouakchott Nord', 'MR.11': 'Tiris Zemmour',
			},
			'MT': {
				'MT.01': 'Attard', 'MT.02': 'Balzan', 'MT.03': 'Birgu', 'MT.04': 'Birkirkara', 'MT.05': 'Birzebbuga', 'MT.06': 'Bormla', 'MT.07': 'Dingli', 'MT.08': 'Fgura', 'MT.09': 'Floriana', 'MT.10': 'Fontana', 'MT.14': 'Gharb', 'MT.15': 'Gharghur', 'MT.16': 'Ghasri', 'MT.17': 'Ghaxaq', 'MT.11': 'Gudja', 'MT.12': 'Gzira', 'MT.18': 'Hamrun', 'MT.19': 'Iklin', 'MT.20': 'Isla', 'MT.21': 'Kalkara', 'MT.23': 'Kirkop', 'MT.24': 'Lija', 'MT.25': 'Luqa', 'MT.26': 'Marsa', 'MT.27': 'Marsaskala', 'MT.28': 'Marsaxlokk', 'MT.29': 'Mdina', 'MT.30': 'Mellieha', 'MT.31': 'Mgarr', 'MT.32': 'Mosta', 'MT.33': 'Mqabba', 'MT.34': 'Msida', 'MT.35': 'Mtarfa', 'MT.36': 'Munxar', 'MT.37': 'Nadur', 'MT.38': 'Naxxar', 'MT.39': 'Paola', 'MT.40': 'Pembroke', 'MT.41': 'Pieta', 'MT.42': 'Qala', 'MT.43': 'Qormi', 'MT.44': 'Qrendi', 'MT.45': 'Rabat Gozo', 'MT.46': 'Rabat Malta', 'MT.47': 'Safi', 'MT.49': 'Saint John', 'MT.48': 'Saint Julian\'s', 'MT.53': 'Saint Lucia\'s', 'MT.51': 'Saint Paul\'s Bay', 'MT.52': 'Sannat', 'MT.54': 'Santa Venera', 'MT.55': 'Siggiewi', 'MT.56': 'Sliema', 'MT.57': 'Swieqi', 'MT.58': 'Ta\' Xbiex', 'MT.59': 'Tarxien', 'MT.60': 'Valletta', 'MT.61': 'Xaghra', 'MT.62': 'Xewkija', 'MT.63': 'Xghajra', 'MT.64': 'Zabbar', 'MT.65': 'Zebbug Gozo', 'MT.67': 'Zejtun', 'MT.68': 'Zurrieq',
			},
			'MU': {
				'MU.BL': 'Black River', 'MU.FL': 'Flacq', 'MU.GP': 'Grand Port', 'MU.MO': 'Moka', 'MU.PA': 'Pamplemousses', 'MU.PW': 'Plaines Wilhems', 'MU.PL': 'Port Louis', 'MU.RR': 'Riviere du Rempart', 'MU.RO': 'Rodrigues Islands', 'MU.SA': 'Savanne',
			},
			'MV': {
				'MV.02': 'Alifu Alifu', 'MV.20': 'Baa', 'MV.28': 'Gaafu Dhaalu', 'MV.23': 'Haa Dhaalu', 'MV.26': 'Kaafu', 'MV.05': 'Laamu', 'MV.MLE': 'Maale', 'MV.12': 'Meemu', 'MV.13': 'Raa', 'MV.01': 'Seenu', 'MV.04': 'Vaavu',
			},
			'MW': {
				'MW.BA': 'Balaka', 'MW.BL': 'Blantyre', 'MW.DO': 'Dowa', 'MW.LI': 'Lilongwe', 'MW.MH': 'Machinga', 'MW.MG': 'Mangochi', 'MW.MZ': 'Mzimba', 'MW.NI': 'Ntchisi', 'MW.SA': 'Salima', 'MW.ZO': 'Zomba',
			},
			'MX': {
				'MX.AGU': 'Aguascalientes', 'MX.BCN': 'Baja California', 'MX.BCS': 'Baja California Sur', 'MX.CAM': 'Campeche', 'MX.CHP': 'Chiapas', 'MX.CHH': 'Chihuahua', 'MX.CMX': 'Ciudad de Mexico', 'MX.COA': 'Coahuila de Zaragoza', 'MX.COL': 'Colima', 'MX.DUR': 'Durango', 'MX.GUA': 'Guanajuato', 'MX.GRO': 'Guerrero', 'MX.HID': 'Hidalgo', 'MX.JAL': 'Jalisco', 'MX.MEX': 'Mexico', 'MX.MIC': 'Michoacan de Ocampo', 'MX.MOR': 'Morelos', 'MX.NAY': 'Nayarit', 'MX.NLE': 'Nuevo Leon', 'MX.OAX': 'Oaxaca', 'MX.PUE': 'Puebla', 'MX.QUE': 'Queretaro', 'MX.ROO': 'Quintana Roo', 'MX.SLP': 'San Luis Potosi', 'MX.SIN': 'Sinaloa', 'MX.SON': 'Sonora', 'MX.TAB': 'Tabasco', 'MX.TAM': 'Tamaulipas', 'MX.TLA': 'Tlaxcala', 'MX.VER': 'Veracruz de Ignacio de la Llave', 'MX.YUC': 'Yucatan', 'MX.ZAC': 'Zacatecas',
			},
			'MY': {
				'MY.01': 'Johor', 'MY.02': 'Kedah', 'MY.03': 'Kelantan', 'MY.04': 'Melaka', 'MY.05': 'Negeri Sembilan', 'MY.06': 'Pahang', 'MY.08': 'Perak', 'MY.09': 'Perlis', 'MY.07': 'Pulau Pinang', 'MY.12': 'Sabah', 'MY.13': 'Sarawak', 'MY.10': 'Selangor', 'MY.11': 'Terengganu', 'MY.14': 'Wilayah Persekutuan Kuala Lumpur', 'MY.15': 'Wilayah Persekutuan Labuan', 'MY.16': 'Wilayah Persekutuan Putrajaya',
			},
			'MZ': {
				'MZ.P': 'Cabo Delgado', 'MZ.G': 'Gaza', 'MZ.I': 'Inhambane', 'MZ.B': 'Manica', 'MZ.L': 'Maputo', 'MZ.N': 'Nampula', 'MZ.A': 'Niassa', 'MZ.S': 'Sofala', 'MZ.T': 'Tete', 'MZ.Q': 'Zambezia',
			},
			'NA': {
				'NA.ER': 'Erongo', 'NA.HA': 'Hardap', 'NA.KA': 'Karas', 'NA.KE': 'Kavango East', 'NA.KH': 'Khomas', 'NA.KU': 'Kunene', 'NA.OW': 'Ohangwena', 'NA.OH': 'Omaheke', 'NA.OS': 'Omusati', 'NA.ON': 'Oshana', 'NA.OT': 'Oshikoto', 'NA.OD': 'Otjozondjupa', 'NA.CA': 'Zambezi',
			},
			'NE': {
				'NE.1': 'Agadez', 'NE.2': 'Diffa', 'NE.3': 'Dosso', 'NE.8': 'Niamey', 'NE.5': 'Tahoua', 'NE.6': 'Tillaberi', 'NE.7': 'Zinder',
			},
			'NG': {
				'NG.AB': 'Abia', 'NG.FC': 'Abuja Federal Capital Territory', 'NG.AD': 'Adamawa', 'NG.AK': 'Akwa Ibom', 'NG.AN': 'Anambra', 'NG.BA': 'Bauchi', 'NG.BY': 'Bayelsa', 'NG.BE': 'Benue', 'NG.BO': 'Borno', 'NG.CR': 'Cross River', 'NG.DE': 'Delta', 'NG.EB': 'Ebonyi', 'NG.ED': 'Edo', 'NG.EK': 'Ekiti', 'NG.EN': 'Enugu', 'NG.GO': 'Gombe', 'NG.IM': 'Imo', 'NG.JI': 'Jigawa', 'NG.KD': 'Kaduna', 'NG.KN': 'Kano', 'NG.KT': 'Katsina', 'NG.KE': 'Kebbi', 'NG.KO': 'Kogi', 'NG.KW': 'Kwara', 'NG.LA': 'Lagos', 'NG.NA': 'Nasarawa', 'NG.NI': 'Niger', 'NG.OG': 'Ogun', 'NG.ON': 'Ondo', 'NG.OS': 'Osun', 'NG.OY': 'Oyo', 'NG.PL': 'Plateau', 'NG.RI': 'Rivers', 'NG.SO': 'Sokoto', 'NG.TA': 'Taraba', 'NG.YO': 'Yobe', 'NG.ZA': 'Zamfara',
			},
			'NI': {
				'NI.BO': 'Boaco', 'NI.CA': 'Carazo', 'NI.CI': 'Chinandega', 'NI.CO': 'Chontales', 'NI.AN': 'Costa Caribe Norte', 'NI.AS': 'Costa Caribe Sur', 'NI.ES': 'Esteli', 'NI.GR': 'Granada', 'NI.JI': 'Jinotega', 'NI.LE': 'Leon', 'NI.MD': 'Madriz', 'NI.MN': 'Managua', 'NI.MS': 'Masaya', 'NI.MT': 'Matagalpa', 'NI.NS': 'Nueva Segovia', 'NI.SJ': 'Rio San Juan', 'NI.RI': 'Rivas',
			},
			'NL': {
				'NL.DR': 'Drenthe', 'NL.FL': 'Flevoland', 'NL.FR': 'Fryslan', 'NL.GE': 'Gelderland', 'NL.GR': 'Groningen', 'NL.LI': 'Limburg', 'NL.NB': 'Noord-Brabant', 'NL.NH': 'Noord-Holland', 'NL.OV': 'Overijssel', 'NL.UT': 'Utrecht', 'NL.ZE': 'Zeeland', 'NL.ZH': 'Zuid-Holland',
			},
			'NO': {
				'NO.02': 'Akershus', 'NO.09': 'Aust-Agder', 'NO.06': 'Buskerud', 'NO.20': 'Finnmark', 'NO.04': 'Hedmark', 'NO.12': 'Hordaland', 'NO.15': 'More og Romsdal', 'NO.17': 'Nord-Trondelag', 'NO.18': 'Nordland', 'NO.05': 'Oppland', 'NO.03': 'Oslo', 'NO.01': 'Ostfold', 'NO.11': 'Rogaland', 'NO.14': 'Sogn og Fjordane', 'NO.16': 'Sor-Trondelag', 'NO.08': 'Telemark', 'NO.19': 'Troms', 'NO.10': 'Vest-Agder', 'NO.07': 'Vestfold',
			},
			'NP': {
				'NP.BA': 'Bagmati', 'NP.BH': 'Bheri', 'NP.DH': 'Dhawalagiri', 'NP.GA': 'Gandaki', 'NP.JA': 'Janakpur', 'NP.KO': 'Kosi', 'NP.LU': 'Lumbini', 'NP.ME': 'Mechi', 'NP.NA': 'Narayani', 'NP.RA': 'Rapti', 'NP.SA': 'Sagarmatha', 'NP.SE': 'Seti',
			},
			'NR': {
				'NR.14': 'Yaren',
			},
			'NZ': {
				'NZ.AUK': 'Auckland', 'NZ.BOP': 'Bay of Plenty', 'NZ.CAN': 'Canterbury', 'NZ.CIT': 'Chatham Islands Territory', 'NZ.GIS': 'Gisborne', 'NZ.HKB': 'Hawke\'s Bay', 'NZ.MWT': 'Manawatu-Wanganui', 'NZ.MBH': 'Marlborough', 'NZ.NSN': 'Nelson', 'NZ.NTL': 'Northland', 'NZ.OTA': 'Otago', 'NZ.STL': 'Southland', 'NZ.TKI': 'Taranaki', 'NZ.TAS': 'Tasman', 'NZ.WKO': 'Waikato', 'NZ.WGN': 'Wellington', 'NZ.WTC': 'West Coast',
			},
			'OM': {
				'OM.DA': 'Ad Dakhiliyah', 'OM.BU': 'Al Buraymi', 'OM.WU': 'Al Wusta', 'OM.ZA': 'Az Zahirah', 'OM.BJ': 'Janub al Batinah', 'OM.SJ': 'Janub ash Sharqiyah', 'OM.MA': 'Masqat', 'OM.MU': 'Musandam', 'OM.BS': 'Shamal al Batinah', 'OM.SS': 'Shamal ash Sharqiyah', 'OM.ZU': 'Zufar',
			},
			'PA': {
				'PA.1': 'Bocas del Toro', 'PA.4': 'Chiriqui', 'PA.2': 'Cocle', 'PA.3': 'Colon', 'PA.6': 'Herrera', 'PA.7': 'Los Santos', 'PA.NB': 'Ngobe-Bugle', 'PA.8': 'Panama', 'PA.9': 'Veraguas',
			},
			'PE': {
				'PE.AMA': 'Amazonas', 'PE.ANC': 'Ancash', 'PE.APU': 'Apurimac', 'PE.ARE': 'Arequipa', 'PE.AYA': 'Ayacucho', 'PE.CAJ': 'Cajamarca', 'PE.CUS': 'Cusco', 'PE.CAL': 'El Callao', 'PE.HUV': 'Huancavelica', 'PE.HUC': 'Huanuco', 'PE.ICA': 'Ica', 'PE.JUN': 'Junin', 'PE.LAL': 'La Libertad', 'PE.LAM': 'Lambayeque', 'PE.LIM': 'Lima', 'PE.LOR': 'Loreto', 'PE.MDD': 'Madre de Dios', 'PE.MOQ': 'Moquegua', 'PE.PAS': 'Pasco', 'PE.PIU': 'Piura', 'PE.PUN': 'Puno', 'PE.SAM': 'San Martin', 'PE.TAC': 'Tacna', 'PE.TUM': 'Tumbes', 'PE.UCA': 'Ucayali',
			},
			'PG': {
				'PG.CPM': 'Central', 'PG.EBR': 'East New Britain', 'PG.EHG': 'Eastern Highlands', 'PG.MPM': 'Madang', 'PG.MRL': 'Manus', 'PG.MPL': 'Morobe', 'PG.NCD': 'National Capital District (Port Moresby)', 'PG.NIK': 'New Ireland', 'PG.SHM': 'Southern Highlands', 'PG.WBK': 'West New Britain', 'PG.WPD': 'Western', 'PG.WHM': 'Western Highlands',
			},
			'PH': {
				'PH.ABR': 'Abra', 'PH.AGN': 'Agusan del Norte', 'PH.AGS': 'Agusan del Sur', 'PH.AKL': 'Aklan', 'PH.ALB': 'Albay', 'PH.ANT': 'Antique', 'PH.APA': 'Apayao', 'PH.AUR': 'Aurora', 'PH.BAS': 'Basilan', 'PH.BAN': 'Bataan', 'PH.BTN': 'Batanes', 'PH.BTG': 'Batangas', 'PH.BEN': 'Benguet', 'PH.BIL': 'Biliran', 'PH.BOH': 'Bohol', 'PH.BUK': 'Bukidnon', 'PH.BUL': 'Bulacan', 'PH.CAG': 'Cagayan', 'PH.CAN': 'Camarines Norte', 'PH.CAS': 'Camarines Sur', 'PH.CAM': 'Camiguin', 'PH.CAP': 'Capiz', 'PH.CAT': 'Catanduanes', 'PH.CAV': 'Cavite', 'PH.CEB': 'Cebu', 'PH.COM': 'Compostela Valley', 'PH.NCO': 'Cotabato', 'PH.DAO': 'Davao Oriental', 'PH.DAV': 'Davao del Norte', 'PH.DAS': 'Davao del Sur', 'PH.DIN': 'Dinagat Islands', 'PH.EAS': 'Eastern Samar', 'PH.GUI': 'Guimaras', 'PH.IFU': 'Ifugao', 'PH.ILN': 'Ilocos Norte', 'PH.ILS': 'Ilocos Sur', 'PH.ILI': 'Iloilo', 'PH.ISA': 'Isabela', 'PH.LUN': 'La Union', 'PH.LAG': 'Laguna', 'PH.LAN': 'Lanao del Norte', 'PH.LAS': 'Lanao del Sur', 'PH.LEY': 'Leyte', 'PH.MAG': 'Maguindanao', 'PH.MAD': 'Marinduque', 'PH.MAS': 'Masbate', 'PH.MDC': 'Mindoro Occidental', 'PH.MDR': 'Mindoro Oriental', 'PH.MSC': 'Misamis Occidental', 'PH.MSR': 'Misamis Oriental', 'PH.MOU': 'Mountain Province', 'PH.00': 'National Capital Region', 'PH.NEC': 'Negros Occidental', 'PH.NER': 'Negros Oriental', 'PH.NSA': 'Northern Samar', 'PH.NUE': 'Nueva Ecija', 'PH.NUV': 'Nueva Vizcaya', 'PH.PLW': 'Palawan', 'PH.PAM': 'Pampanga', 'PH.PAN': 'Pangasinan', 'PH.QUE': 'Quezon', 'PH.QUI': 'Quirino', 'PH.RIZ': 'Rizal', 'PH.ROM': 'Romblon', 'PH.WSA': 'Samar', 'PH.SAR': 'Sarangani', 'PH.SIG': 'Siquijor', 'PH.SOR': 'Sorsogon', 'PH.SCO': 'South Cotabato', 'PH.SLE': 'Southern Leyte', 'PH.SUK': 'Sultan Kudarat', 'PH.SLU': 'Sulu', 'PH.SUN': 'Surigao del Norte', 'PH.SUR': 'Surigao del Sur', 'PH.TAR': 'Tarlac', 'PH.TAW': 'Tawi-Tawi', 'PH.ZMB': 'Zambales', 'PH.ZSI': 'Zamboanga Sibugay', 'PH.ZAN': 'Zamboanga del Norte', 'PH.ZAS': 'Zamboanga del Sur',
			},
			'PK': {
				'PK.JK': 'Azad Jammu and Kashmir', 'PK.BA': 'Balochistan', 'PK.TA': 'Federally Administered Tribal Areas', 'PK.GB': 'Gilgit-Baltistan', 'PK.IS': 'Islamabad', 'PK.KP': 'Khyber Pakhtunkhwa', 'PK.PB': 'Punjab', 'PK.SD': 'Sindh',
			},
			'PL': {
				'PL.02': 'Dolnoslaskie', 'PL.04': 'Kujawsko-pomorskie', 'PL.10': 'Lodzkie', 'PL.06': 'Lubelskie', 'PL.08': 'Lubuskie', 'PL.12': 'Malopolskie', 'PL.14': 'Mazowieckie', 'PL.16': 'Opolskie', 'PL.18': 'Podkarpackie', 'PL.20': 'Podlaskie', 'PL.22': 'Pomorskie', 'PL.24': 'Slaskie', 'PL.26': 'Swietokrzyskie', 'PL.28': 'Warminsko-mazurskie', 'PL.30': 'Wielkopolskie', 'PL.32': 'Zachodniopomorskie',
			},
			'PS': {
				'PS.BTH': 'Bethlehem', 'PS.GZA': 'Gaza', 'PS.HBN': 'Hebron', 'PS.JEN': 'Jenin', 'PS.JRH': 'Jericho and Al Aghwar', 'PS.JEM': 'Jerusalem', 'PS.NBS': 'Nablus', 'PS.QQA': 'Qalqilya', 'PS.RBH': 'Ramallah', 'PS.SLT': 'Salfit', 'PS.TBS': 'Tubas', 'PS.TKM': 'Tulkarm',
			},
			'PT': {
				'PT.01': 'Aveiro', 'PT.02': 'Beja', 'PT.03': 'Braga', 'PT.04': 'Braganca', 'PT.05': 'Castelo Branco', 'PT.06': 'Coimbra', 'PT.07': 'Evora', 'PT.08': 'Faro', 'PT.09': 'Guarda', 'PT.10': 'Leiria', 'PT.11': 'Lisboa', 'PT.12': 'Portalegre', 'PT.13': 'Porto', 'PT.30': 'Regiao Autonoma da Madeira', 'PT.20': 'Regiao Autonoma dos Acores', 'PT.14': 'Santarem', 'PT.15': 'Setubal', 'PT.16': 'Viana do Castelo', 'PT.17': 'Vila Real', 'PT.18': 'Viseu',
			},
			'PW': {
				'PW.004': 'Airai', 'PW.100': 'Kayangel', 'PW.150': 'Koror', 'PW.212': 'Melekeok', 'PW.222': 'Ngardmau',
			},
			'PY': {
				'PY.16': 'Alto Paraguay', 'PY.10': 'Alto Parana', 'PY.13': 'Amambay', 'PY.ASU': 'Asuncion', 'PY.19': 'Boqueron', 'PY.5': 'Caaguazu', 'PY.6': 'Caazapa', 'PY.14': 'Canindeyu', 'PY.11': 'Central', 'PY.1': 'Concepcion', 'PY.3': 'Cordillera', 'PY.4': 'Guaira', 'PY.7': 'Itapua', 'PY.8': 'Misiones', 'PY.12': 'Neembucu', 'PY.9': 'Paraguari', 'PY.15': 'Presidente Hayes', 'PY.2': 'San Pedro',
			},
			'QA': {
				'QA.DA': 'Ad Dawhah', 'QA.KH': 'Al Khawr wa adh Dhakhirah', 'QA.WA': 'Al Wakrah', 'QA.RA': 'Ar Rayyan', 'QA.MS': 'Ash Shamal', 'QA.ZA': 'Az Za\'ayin', 'QA.US': 'Umm Salal',
			},
			'RO': {
				'RO.AB': 'Alba', 'RO.AR': 'Arad', 'RO.AG': 'Arges', 'RO.BC': 'Bacau', 'RO.BH': 'Bihor', 'RO.BN': 'Bistrita-Nasaud', 'RO.BT': 'Botosani', 'RO.BR': 'Braila', 'RO.BV': 'Brasov', 'RO.B': 'Bucuresti', 'RO.BZ': 'Buzau', 'RO.CL': 'Calarasi', 'RO.CS': 'Caras-Severin', 'RO.CJ': 'Cluj', 'RO.CT': 'Constanta', 'RO.CV': 'Covasna', 'RO.DB': 'Dambovita', 'RO.DJ': 'Dolj', 'RO.GL': 'Galati', 'RO.GR': 'Giurgiu', 'RO.GJ': 'Gorj', 'RO.HR': 'Harghita', 'RO.HD': 'Hunedoara', 'RO.IL': 'Ialomita', 'RO.IS': 'Iasi', 'RO.IF': 'Ilfov', 'RO.MM': 'Maramures', 'RO.MH': 'Mehedinti', 'RO.MS': 'Mures', 'RO.NT': 'Neamt', 'RO.OT': 'Olt', 'RO.PH': 'Prahova', 'RO.SJ': 'Salaj', 'RO.SM': 'Satu Mare', 'RO.SB': 'Sibiu', 'RO.SV': 'Suceava', 'RO.TR': 'Teleorman', 'RO.TM': 'Timis', 'RO.TL': 'Tulcea', 'RO.VL': 'Valcea', 'RO.VS': 'Vaslui', 'RO.VN': 'Vrancea',
			},
			'RS': {
				'RS.00': 'Beograd', 'RS.14': 'Borski okrug', 'RS.11': 'Branicevski okrug', 'RS.23': 'Jablanicki okrug', 'RS.06': 'Juznobacki okrug', 'RS.04': 'Juznobanatski okrug', 'RS.09': 'Kolubarski okrug', 'RS.28': 'Kosovsko-Mitrovacki okrug', 'RS.08': 'Macvanski okrug', 'RS.17': 'Moravicki okrug', 'RS.20': 'Nisavski okrug', 'RS.24': 'Pcinjski okrug', 'RS.22': 'Pirotski okrug', 'RS.10': 'Podunavski okrug', 'RS.13': 'Pomoravski okrug', 'RS.27': 'Prizrenski okrug', 'RS.19': 'Rasinski okrug', 'RS.18': 'Raski okrug', 'RS.01': 'Severnobacki okrug', 'RS.03': 'Severnobanatski okrug', 'RS.02': 'Srednjebanatski okrug', 'RS.07': 'Sremski okrug', 'RS.12': 'Sumadijski okrug', 'RS.21': 'Toplicki okrug', 'RS.15': 'Zajecarski okrug', 'RS.05': 'Zapadnobacki okrug', 'RS.16': 'Zlatiborski okrug',
			},
			'RU': {
				'RU.AD': 'Adygeya, Respublika', 'RU.AL': 'Altay, Respublika', 'RU.ALT': 'Altayskiy kray', 'RU.AMU': 'Amurskaya oblast\'', 'RU.ARK': 'Arkhangel\'skaya oblast\'', 'RU.AST': 'Astrakhanskaya oblast\'', 'RU.BA': 'Bashkortostan, Respublika', 'RU.BEL': 'Belgorodskaya oblast\'', 'RU.BRY': 'Bryanskaya oblast\'', 'RU.BU': 'Buryatiya, Respublika', 'RU.CE': 'Chechenskaya Respublika', 'RU.CHE': 'Chelyabinskaya oblast\'', 'RU.CHU': 'Chukotskiy avtonomnyy okrug', 'RU.CU': 'Chuvashskaya Respublika', 'RU.DA': 'Dagestan, Respublika', 'RU.IN': 'Ingushetiya, Respublika', 'RU.IRK': 'Irkutskaya oblast\'', 'RU.IVA': 'Ivanovskaya oblast\'', 'RU.KB': 'Kabardino-Balkarskaya Respublika', 'RU.KGD': 'Kaliningradskaya oblast\'', 'RU.KL': 'Kalmykiya, Respublika', 'RU.KLU': 'Kaluzhskaya oblast\'', 'RU.KAM': 'Kamchatskiy kray', 'RU.KC': 'Karachayevo-Cherkesskaya Respublika', 'RU.KR': 'Kareliya, Respublika', 'RU.KEM': 'Kemerovskaya oblast\'', 'RU.KHA': 'Khabarovskiy kray', 'RU.KK': 'Khakasiya, Respublika', 'RU.KHM': 'Khanty-Mansiyskiy avtonomnyy okrug', 'RU.KIR': 'Kirovskaya oblast\'', 'RU.KO': 'Komi, Respublika', 'RU.KOS': 'Kostromskaya oblast\'', 'RU.KDA': 'Krasnodarskiy kray', 'RU.KYA': 'Krasnoyarskiy kray', 'RU.KGN': 'Kurganskaya oblast\'', 'RU.KRS': 'Kurskaya oblast\'', 'RU.LEN': 'Leningradskaya oblast\'', 'RU.LIP': 'Lipetskaya oblast\'', 'RU.MAG': 'Magadanskaya oblast\'', 'RU.ME': 'Mariy El, Respublika', 'RU.MO': 'Mordoviya, Respublika', 'RU.MOS': 'Moskovskaya oblast\'', 'RU.MOW': 'Moskva', 'RU.MUR': 'Murmanskaya oblast\'', 'RU.NEN': 'Nenetskiy avtonomnyy okrug', 'RU.NIZ': 'Nizhegorodskaya oblast\'', 'RU.NGR': 'Novgorodskaya oblast\'', 'RU.NVS': 'Novosibirskaya oblast\'', 'RU.OMS': 'Omskaya oblast\'', 'RU.ORE': 'Orenburgskaya oblast\'', 'RU.ORL': 'Orlovskaya oblast\'', 'RU.PNZ': 'Penzenskaya oblast\'', 'RU.PER': 'Permskiy kray', 'RU.PRI': 'Primorskiy kray', 'RU.PSK': 'Pskovskaya oblast\'', 'RU.ROS': 'Rostovskaya oblast\'', 'RU.RYA': 'Ryazanskaya oblast\'', 'RU.SA': 'Saha, Respublika', 'RU.SAK': 'Sakhalinskaya oblast\'', 'RU.SAM': 'Samarskaya oblast\'', 'RU.SPE': 'Sankt-Peterburg', 'RU.SAR': 'Saratovskaya oblast\'', 'RU.SE': 'Severnaya Osetiya, Respublika', 'RU.SMO': 'Smolenskaya oblast\'', 'RU.STA': 'Stavropol\'skiy kray', 'RU.SVE': 'Sverdlovskaya oblast\'', 'RU.TAM': 'Tambovskaya oblast\'', 'RU.TA': 'Tatarstan, Respublika', 'RU.TOM': 'Tomskaya oblast\'', 'RU.TUL': 'Tul\'skaya oblast\'', 'RU.TVE': 'Tverskaya oblast\'', 'RU.TYU': 'Tyumenskaya oblast\'', 'RU.TY': 'Tyva, Respublika', 'RU.UD': 'Udmurtskaya Respublika', 'RU.ULY': 'Ul\'yanovskaya oblast\'', 'RU.VLA': 'Vladimirskaya oblast\'', 'RU.VGG': 'Volgogradskaya oblast\'', 'RU.VLG': 'Vologodskaya oblast\'', 'RU.VOR': 'Voronezhskaya oblast\'', 'RU.YAN': 'Yamalo-Nenetskiy avtonomnyy okrug', 'RU.YAR': 'Yaroslavskaya oblast\'', 'RU.YEV': 'Yevreyskaya avtonomnaya oblast\'', 'RU.ZAB': 'Zabaykal\'skiy kray',
			},
			'RW': {
				'RW.02': 'Est', 'RW.03': 'Nord', 'RW.04': 'Ouest', 'RW.05': 'Sud', 'RW.01': 'Ville de Kigali',
			},
			'SA': {
				'SA.14': '\'Asir', 'SA.11': 'Al Bahah', 'SA.08': 'Al Hudud ash Shamaliyah', 'SA.12': 'Al Jawf', 'SA.03': 'Al Madinah al Munawwarah', 'SA.05': 'Al Qasim', 'SA.01': 'Ar Riyad', 'SA.04': 'Ash Sharqiyah', 'SA.06': 'Ha\'il', 'SA.09': 'Jazan', 'SA.02': 'Makkah al Mukarramah', 'SA.10': 'Najran', 'SA.07': 'Tabuk',
			},
			'SB': {
				'SB.GU': 'Guadalcanal',
			},
			'SC': {
				'SC.01': 'Anse aux Pins', 'SC.06': 'Baie Lazare', 'SC.08': 'Beau Vallon', 'SC.10': 'Bel Ombre', 'SC.11': 'Cascade', 'SC.16': 'English River', 'SC.13': 'Grand Anse Mahe', 'SC.15': 'La Digue', 'SC.23': 'Takamaka',
			},
			'SD': {
				'SD.NB': 'Blue Nile', 'SD.GD': 'Gedaref', 'SD.GZ': 'Gezira', 'SD.KA': 'Kassala', 'SD.KH': 'Khartoum', 'SD.DN': 'North Darfur', 'SD.KN': 'North Kordofan', 'SD.NO': 'Northern', 'SD.RS': 'Red Sea', 'SD.NR': 'River Nile', 'SD.SI': 'Sennar', 'SD.DS': 'South Darfur', 'SD.KS': 'South Kordofan', 'SD.DW': 'West Darfur', 'SD.NW': 'White Nile',
			},
			'SE': {
				'SE.K': 'Blekinge lan', 'SE.W': 'Dalarnas lan', 'SE.X': 'Gavleborgs lan', 'SE.I': 'Gotlands lan', 'SE.N': 'Hallands lan', 'SE.Z': 'Jamtlands lan', 'SE.F': 'Jonkopings lan', 'SE.H': 'Kalmar lan', 'SE.G': 'Kronobergs lan', 'SE.BD': 'Norrbottens lan', 'SE.T': 'Orebro lan', 'SE.E': 'Ostergotlands lan', 'SE.M': 'Skane lan', 'SE.D': 'Sodermanlands lan', 'SE.AB': 'Stockholms lan', 'SE.C': 'Uppsala lan', 'SE.S': 'Varmlands lan', 'SE.AC': 'Vasterbottens lan', 'SE.Y': 'Vasternorrlands lan', 'SE.U': 'Vastmanlands lan', 'SE.O': 'Vastra Gotalands lan',
			},
			'SH': {
				'SH.HL': 'Saint Helena',
			},
			'SI': {
				'SI.001': 'Ajdovscina', 'SI.195': 'Apace', 'SI.002': 'Beltinci', 'SI.148': 'Benedikt', 'SI.149': 'Bistrica ob Sotli', 'SI.003': 'Bled', 'SI.150': 'Bloke', 'SI.004': 'Bohinj', 'SI.005': 'Borovnica', 'SI.006': 'Bovec', 'SI.151': 'Braslovce', 'SI.007': 'Brda', 'SI.009': 'Brezice', 'SI.008': 'Brezovica', 'SI.152': 'Cankova', 'SI.011': 'Celje', 'SI.012': 'Cerklje na Gorenjskem', 'SI.013': 'Cerknica', 'SI.014': 'Cerkno', 'SI.196': 'Cirkulane', 'SI.015': 'Crensovci', 'SI.017': 'Crnomelj', 'SI.018': 'Destrnik', 'SI.019': 'Divaca', 'SI.154': 'Dobje', 'SI.020': 'Dobrepolje', 'SI.155': 'Dobrna', 'SI.021': 'Dobrova-Polhov Gradec', 'SI.156': 'Dobrovnik', 'SI.023': 'Domzale', 'SI.024': 'Dornava', 'SI.025': 'Dravograd', 'SI.026': 'Duplek', 'SI.207': 'Gorje', 'SI.029': 'Gornja Radgona', 'SI.031': 'Gornji Petrovci', 'SI.158': 'Grad', 'SI.032': 'Grosuplje', 'SI.159': 'Hajdina', 'SI.160': 'Hoce-Slivnica', 'SI.161': 'Hodos', 'SI.162': 'Horjul', 'SI.034': 'Hrastnik', 'SI.035': 'Hrpelje-Kozina', 'SI.036': 'Idrija', 'SI.037': 'Ig', 'SI.038': 'Ilirska Bistrica', 'SI.039': 'Ivancna Gorica', 'SI.040': 'Izola', 'SI.041': 'Jesenice', 'SI.042': 'Jursinci', 'SI.043': 'Kamnik', 'SI.044': 'Kanal', 'SI.045': 'Kidricevo', 'SI.046': 'Kobarid', 'SI.047': 'Kobilje', 'SI.048': 'Kocevje', 'SI.049': 'Komen', 'SI.164': 'Komenda', 'SI.050': 'Koper', 'SI.197': 'Kosanjevica na Krki', 'SI.165': 'Kostel', 'SI.052': 'Kranj', 'SI.053': 'Kranjska Gora', 'SI.166': 'Krizevci', 'SI.054': 'Krsko', 'SI.055': 'Kungota', 'SI.056': 'Kuzma', 'SI.057': 'Lasko', 'SI.058': 'Lenart', 'SI.059': 'Lendava', 'SI.060': 'Litija', 'SI.061': 'Ljubljana', 'SI.063': 'Ljutomer', 'SI.208': 'Log-Dragomer', 'SI.064': 'Logatec', 'SI.065': 'Loska Dolina', 'SI.167': 'Lovrenc na Pohorju', 'SI.067': 'Luce', 'SI.068': 'Lukovica', 'SI.069': 'Majsperk', 'SI.198': 'Makole', 'SI.070': 'Maribor', 'SI.168': 'Markovci', 'SI.071': 'Medvode', 'SI.072': 'Menges', 'SI.073': 'Metlika', 'SI.074': 'Mezica', 'SI.169': 'Miklavz na Dravskem Polju', 'SI.075': 'Miren-Kostanjevica', 'SI.170': 'Mirna Pec', 'SI.076': 'Mislinja', 'SI.199': 'Mokronog-Trebelno', 'SI.077': 'Moravce', 'SI.079': 'Mozirje', 'SI.080': 'Murska Sobota', 'SI.081': 'Muta', 'SI.082': 'Naklo', 'SI.083': 'Nazarje', 'SI.084': 'Nova Gorica', 'SI.085': 'Novo Mesto', 'SI.086': 'Odranci', 'SI.171': 'Oplotnica', 'SI.087': 'Ormoz', 'SI.090': 'Piran', 'SI.091': 'Pivka', 'SI.092': 'Podcetrtek', 'SI.172': 'Podlehnik', 'SI.200': 'Poljcane', 'SI.173': 'Polzela', 'SI.094': 'Postojna', 'SI.174': 'Prebold', 'SI.095': 'Preddvor', 'SI.175': 'Prevalje', 'SI.096': 'Ptuj', 'SI.097': 'Puconci', 'SI.098': 'Race-Fram', 'SI.099': 'Radece', 'SI.100': 'Radenci', 'SI.101': 'Radlje ob Dravi', 'SI.102': 'Radovljica', 'SI.103': 'Ravne na Koroskem', 'SI.176': 'Razkrizje', 'SI.209': 'Recica ob Savinji', 'SI.201': 'Rence-Vogrsko', 'SI.104': 'Ribnica', 'SI.106': 'Rogaska Slatina', 'SI.105': 'Rogasovci', 'SI.108': 'Ruse', 'SI.033': 'Salovci', 'SI.109': 'Semic', 'SI.183': 'Sempeter-Vrtojba', 'SI.117': 'Sencur', 'SI.118': 'Sentilj', 'SI.119': 'Sentjernej', 'SI.120': 'Sentjur', 'SI.211': 'Sentrupert', 'SI.110': 'Sevnica', 'SI.111': 'Sezana', 'SI.121': 'Skocjan', 'SI.122': 'Skofja Loka', 'SI.123': 'Skofljica', 'SI.112': 'Slovenj Gradec', 'SI.113': 'Slovenska Bistrica', 'SI.114': 'Slovenske Konjice', 'SI.124': 'Smarje pri Jelsah', 'SI.206': 'Smarjeske Toplice', 'SI.125': 'Smartno ob Paki', 'SI.194': 'Smartno pri Litiji', 'SI.179': 'Sodrazica', 'SI.180': 'Solcava', 'SI.126': 'Sostanj', 'SI.115': 'Starse', 'SI.127': 'Store', 'SI.203': 'Straza', 'SI.182': 'Sveti Andraz v Slovenskih Goricah', 'SI.116': 'Sveti Jurij', 'SI.210': 'Sveti Jurij v Slovenskih Goricah', 'SI.205': 'Sveti Tomaz', 'SI.184': 'Tabor', 'SI.010': 'Tisina', 'SI.128': 'Tolmin', 'SI.129': 'Trbovlje', 'SI.130': 'Trebnje', 'SI.185': 'Trnovska Vas', 'SI.131': 'Trzic', 'SI.186': 'Trzin', 'SI.132': 'Turnisce', 'SI.133': 'Velenje', 'SI.187': 'Velika Polana', 'SI.134': 'Velike Lasce', 'SI.188': 'Verzej', 'SI.135': 'Videm', 'SI.136': 'Vipava', 'SI.137': 'Vitanje', 'SI.138': 'Vodice', 'SI.139': 'Vojnik', 'SI.189': 'Vransko', 'SI.140': 'Vrhnika', 'SI.141': 'Vuzenica', 'SI.142': 'Zagorje ob Savi', 'SI.190': 'Zalec', 'SI.143': 'Zavrc', 'SI.146': 'Zelezniki', 'SI.191': 'Zetale', 'SI.147': 'Ziri', 'SI.144': 'Zrece', 'SI.193': 'Zuzemberk',
			},
			'SK': {
				'SK.BC': 'Banskobystricky kraj', 'SK.BL': 'Bratislavsky kraj', 'SK.KI': 'Kosicky kraj', 'SK.NI': 'Nitriansky kraj', 'SK.PV': 'Presovsky kraj', 'SK.TC': 'Trenciansky kraj', 'SK.TA': 'Trnavsky kraj', 'SK.ZI': 'Zilinsky kraj',
			},
			'SL': {
				'SL.E': 'Eastern', 'SL.W': 'Western Area',
			},
			'SM': {
				'SM.02': 'Chiesanuova', 'SM.03': 'Domagnano', 'SM.07': 'San Marino', 'SM.09': 'Serravalle',
			},
			'SN': {
				'SN.DK': 'Dakar', 'SN.DB': 'Diourbel', 'SN.FK': 'Fatick', 'SN.KA': 'Kaffrine', 'SN.KL': 'Kaolack', 'SN.KD': 'Kolda', 'SN.LG': 'Louga', 'SN.MT': 'Matam', 'SN.SL': 'Saint-Louis', 'SN.TC': 'Tambacounda', 'SN.TH': 'Thies', 'SN.ZG': 'Ziguinchor',
			},
			'SO': {
				'SO.AW': 'Awdal', 'SO.BN': 'Banaadir', 'SO.BR': 'Bari', 'SO.BY': 'Bay', 'SO.HI': 'Hiiraan', 'SO.NU': 'Nugaal', 'SO.TO': 'Togdheer', 'SO.WO': 'Woqooyi Galbeed',
			},
			'SR': {
				'SR.BR': 'Brokopondo', 'SR.CM': 'Commewijne', 'SR.NI': 'Nickerie', 'SR.PR': 'Para', 'SR.PM': 'Paramaribo', 'SR.SA': 'Saramacca', 'SR.SI': 'Sipaliwini', 'SR.WA': 'Wanica',
			},
			'SS': {
				'SS.EC': 'Central Equatoria', 'SS.EE': 'Eastern Equatoria', 'SS.LK': 'Lakes', 'SS.UY': 'Unity', 'SS.NU': 'Upper Nile', 'SS.EW': 'Western Equatoria',
			},
			'ST': {
				'ST.P': 'Principe', 'ST.S': 'Sao Tome',
			},
			'SV': {
				'SV.AH': 'Ahuachapan', 'SV.CA': 'Cabanas', 'SV.CH': 'Chalatenango', 'SV.CU': 'Cuscatlan', 'SV.LI': 'La Libertad', 'SV.PA': 'La Paz', 'SV.UN': 'La Union', 'SV.MO': 'Morazan', 'SV.SM': 'San Miguel', 'SV.SS': 'San Salvador', 'SV.SV': 'San Vicente', 'SV.SA': 'Santa Ana', 'SV.SO': 'Sonsonate', 'SV.US': 'Usulutan',
			},
			'SY': {
				'SY.HA': 'Al Hasakah', 'SY.LA': 'Al Ladhiqiyah', 'SY.QU': 'Al Qunaytirah', 'SY.RA': 'Ar Raqqah', 'SY.SU': 'As Suwayda\'', 'SY.DR': 'Dar\'a', 'SY.DY': 'Dayr az Zawr', 'SY.DI': 'Dimashq', 'SY.HL': 'Halab', 'SY.HM': 'Hamah', 'SY.HI': 'Hims', 'SY.ID': 'Idlib', 'SY.RD': 'Rif Dimashq', 'SY.TA': 'Tartus',
			},
			'SZ': {
				'SZ.HH': 'Hhohho', 'SZ.LU': 'Lubombo', 'SZ.MA': 'Manzini',
			},
			'TD': {
				'TD.GR': 'Guera', 'TD.HL': 'Hadjer Lamis', 'TD.LO': 'Logone-Occidental', 'TD.ME': 'Mayo-Kebbi-Est', 'TD.OD': 'Ouaddai', 'TD.TI': 'Tibesti', 'TD.ND': 'Ville de Ndjamena',
			},
			'TG': {
				'TG.K': 'Kara', 'TG.M': 'Maritime', 'TG.P': 'Plateaux',
			},
			'TH': {
				'TH.37': 'Amnat Charoen', 'TH.15': 'Ang Thong', 'TH.38': 'Bueng Kan', 'TH.31': 'Buri Ram', 'TH.24': 'Chachoengsao', 'TH.18': 'Chai Nat', 'TH.36': 'Chaiyaphum', 'TH.22': 'Chanthaburi', 'TH.50': 'Chiang Mai', 'TH.57': 'Chiang Rai', 'TH.20': 'Chon Buri', 'TH.86': 'Chumphon', 'TH.46': 'Kalasin', 'TH.62': 'Kamphaeng Phet', 'TH.71': 'Kanchanaburi', 'TH.40': 'Khon Kaen', 'TH.81': 'Krabi', 'TH.10': 'Krung Thep Maha Nakhon', 'TH.52': 'Lampang', 'TH.51': 'Lamphun', 'TH.42': 'Loei', 'TH.16': 'Lop Buri', 'TH.58': 'Mae Hong Son', 'TH.44': 'Maha Sarakham', 'TH.49': 'Mukdahan', 'TH.26': 'Nakhon Nayok', 'TH.73': 'Nakhon Pathom', 'TH.48': 'Nakhon Phanom', 'TH.30': 'Nakhon Ratchasima', 'TH.60': 'Nakhon Sawan', 'TH.80': 'Nakhon Si Thammarat', 'TH.55': 'Nan', 'TH.96': 'Narathiwat', 'TH.39': 'Nong Bua Lam Phu', 'TH.43': 'Nong Khai', 'TH.12': 'Nonthaburi', 'TH.13': 'Pathum Thani', 'TH.94': 'Pattani', 'TH.82': 'Phangnga', 'TH.93': 'Phatthalung', 'TH.56': 'Phayao', 'TH.67': 'Phetchabun', 'TH.76': 'Phetchaburi', 'TH.66': 'Phichit', 'TH.65': 'Phitsanulok', 'TH.14': 'Phra Nakhon Si Ayutthaya', 'TH.54': 'Phrae', 'TH.83': 'Phuket', 'TH.25': 'Prachin Buri', 'TH.77': 'Prachuap Khiri Khan', 'TH.85': 'Ranong', 'TH.70': 'Ratchaburi', 'TH.21': 'Rayong', 'TH.45': 'Roi Et', 'TH.27': 'Sa Kaeo', 'TH.47': 'Sakon Nakhon', 'TH.11': 'Samut Prakan', 'TH.74': 'Samut Sakhon', 'TH.75': 'Samut Songkhram', 'TH.19': 'Saraburi', 'TH.91': 'Satun', 'TH.33': 'Si Sa Ket', 'TH.17': 'Sing Buri', 'TH.90': 'Songkhla', 'TH.64': 'Sukhothai', 'TH.72': 'Suphan Buri', 'TH.84': 'Surat Thani', 'TH.32': 'Surin', 'TH.63': 'Tak', 'TH.92': 'Trang', 'TH.23': 'Trat', 'TH.34': 'Ubon Ratchathani', 'TH.41': 'Udon Thani', 'TH.61': 'Uthai Thani', 'TH.53': 'Uttaradit', 'TH.95': 'Yala', 'TH.35': 'Yasothon',
			},
			'TJ': {
				'TJ.DU': 'Dushanbe', 'TJ.KT': 'Khatlon', 'TJ.GB': 'Kuhistoni Badakhshon', 'TJ.RA': 'Nohiyahoi Tobei Jumhuri', 'TJ.SU': 'Sughd',
			},
			'TL': {
				'TL.AN': 'Ainaro', 'TL.CO': 'Cova Lima', 'TL.DI': 'Dili',
			},
			'TM': {
				'TM.A': 'Ahal', 'TM.B': 'Balkan', 'TM.D': 'Dasoguz', 'TM.L': 'Lebap', 'TM.M': 'Mary',
			},
			'TN': {
				'TN.31': 'Beja', 'TN.13': 'Ben Arous', 'TN.23': 'Bizerte', 'TN.81': 'Gabes', 'TN.71': 'Gafsa', 'TN.32': 'Jendouba', 'TN.41': 'Kairouan', 'TN.42': 'Kasserine', 'TN.73': 'Kebili', 'TN.12': 'L\'Ariana', 'TN.14': 'La Manouba', 'TN.33': 'Le Kef', 'TN.53': 'Mahdia', 'TN.82': 'Medenine', 'TN.52': 'Monastir', 'TN.21': 'Nabeul', 'TN.61': 'Sfax', 'TN.43': 'Sidi Bouzid', 'TN.34': 'Siliana', 'TN.51': 'Sousse', 'TN.83': 'Tataouine', 'TN.72': 'Tozeur', 'TN.11': 'Tunis', 'TN.22': 'Zaghouan',
			},
			'TO': {
				'TO.04': 'Tongatapu',
			},
			'TR': {
				'TR.01': 'Adana', 'TR.02': 'Adiyaman', 'TR.03': 'Afyonkarahisar', 'TR.04': 'Agri', 'TR.68': 'Aksaray', 'TR.05': 'Amasya', 'TR.06': 'Ankara', 'TR.07': 'Antalya', 'TR.75': 'Ardahan', 'TR.08': 'Artvin', 'TR.09': 'Aydin', 'TR.10': 'Balikesir', 'TR.74': 'Bartin', 'TR.72': 'Batman', 'TR.69': 'Bayburt', 'TR.11': 'Bilecik', 'TR.12': 'Bingol', 'TR.13': 'Bitlis', 'TR.14': 'Bolu', 'TR.15': 'Burdur', 'TR.16': 'Bursa', 'TR.17': 'Canakkale', 'TR.18': 'Cankiri', 'TR.19': 'Corum', 'TR.20': 'Denizli', 'TR.21': 'Diyarbakir', 'TR.81': 'Duzce', 'TR.22': 'Edirne', 'TR.23': 'Elazig', 'TR.24': 'Erzincan', 'TR.25': 'Erzurum', 'TR.26': 'Eskisehir', 'TR.27': 'Gaziantep', 'TR.28': 'Giresun', 'TR.29': 'Gumushane', 'TR.30': 'Hakkari', 'TR.31': 'Hatay', 'TR.76': 'Igdir', 'TR.32': 'Isparta', 'TR.34': 'Istanbul', 'TR.35': 'Izmir', 'TR.46': 'Kahramanmaras', 'TR.78': 'Karabuk', 'TR.70': 'Karaman', 'TR.36': 'Kars', 'TR.37': 'Kastamonu', 'TR.38': 'Kayseri', 'TR.79': 'Kilis', 'TR.71': 'Kirikkale', 'TR.39': 'Kirklareli', 'TR.40': 'Kirsehir', 'TR.41': 'Kocaeli', 'TR.42': 'Konya', 'TR.43': 'Kutahya', 'TR.44': 'Malatya', 'TR.45': 'Manisa', 'TR.47': 'Mardin', 'TR.33': 'Mersin', 'TR.48': 'Mugla', 'TR.49': 'Mus', 'TR.50': 'Nevsehir', 'TR.51': 'Nigde', 'TR.52': 'Ordu', 'TR.80': 'Osmaniye', 'TR.53': 'Rize', 'TR.54': 'Sakarya', 'TR.55': 'Samsun', 'TR.63': 'Sanliurfa', 'TR.56': 'Siirt', 'TR.57': 'Sinop', 'TR.73': 'Sirnak', 'TR.58': 'Sivas', 'TR.59': 'Tekirdag', 'TR.60': 'Tokat', 'TR.61': 'Trabzon', 'TR.62': 'Tunceli', 'TR.64': 'Usak', 'TR.65': 'Van', 'TR.77': 'Yalova', 'TR.66': 'Yozgat', 'TR.67': 'Zonguldak',
			},
			'TT': {
				'TT.ARI': 'Arima', 'TT.CHA': 'Chaguanas', 'TT.CTT': 'Couva-Tabaquite-Talparo', 'TT.DMN': 'Diego Martin', 'TT.MRC': 'Mayaro-Rio Claro', 'TT.PED': 'Penal-Debe', 'TT.PTF': 'Point Fortin', 'TT.POS': 'Port of Spain', 'TT.PRT': 'Princes Town', 'TT.SFO': 'San Fernando', 'TT.SJL': 'San Juan-Laventille', 'TT.SGE': 'Sangre Grande', 'TT.SIP': 'Siparia', 'TT.TOB': 'Tobago', 'TT.TUP': 'Tunapuna-Piarco',
			},
			'TV': {
				'TV.FUN': 'Funafuti',
			},
			'TW': {
				'TW.CHA': 'Changhua', 'TW.CYQ': 'Chiayi', 'TW.HSQ': 'Hsinchu', 'TW.HUA': 'Hualien', 'TW.KHH': 'Kaohsiung', 'TW.KEE': 'Keelung', 'TW.KIN': 'Kinmen', 'TW.LIE': 'Lienchiang', 'TW.MIA': 'Miaoli', 'TW.NAN': 'Nantou', 'TW.NWT': 'New Taipei', 'TW.PEN': 'Penghu', 'TW.PIF': 'Pingtung', 'TW.TXG': 'Taichung', 'TW.TNN': 'Tainan', 'TW.TPE': 'Taipei', 'TW.TTT': 'Taitung', 'TW.TAO': 'Taoyuan', 'TW.ILA': 'Yilan', 'TW.YUN': 'Yunlin',
			},
			'TZ': {
				'TZ.01': 'Arusha', 'TZ.02': 'Dar es Salaam', 'TZ.03': 'Dodoma', 'TZ.27': 'Geita', 'TZ.04': 'Iringa', 'TZ.05': 'Kagera', 'TZ.07': 'Kaskazini Unguja', 'TZ.28': 'Katavi', 'TZ.08': 'Kigoma', 'TZ.09': 'Kilimanjaro', 'TZ.10': 'Kusini Pemba', 'TZ.11': 'Kusini Unguja', 'TZ.12': 'Lindi', 'TZ.26': 'Manyara', 'TZ.13': 'Mara', 'TZ.14': 'Mbeya', 'TZ.15': 'Mjini Magharibi', 'TZ.16': 'Morogoro', 'TZ.17': 'Mtwara', 'TZ.18': 'Mwanza', 'TZ.29': 'Njombe', 'TZ.19': 'Pwani', 'TZ.20': 'Rukwa', 'TZ.21': 'Ruvuma', 'TZ.22': 'Shinyanga', 'TZ.30': 'Simiyu', 'TZ.23': 'Singida', 'TZ.24': 'Tabora', 'TZ.25': 'Tanga',
			},
			'UA': {
				'UA.43': 'Avtonomna Respublika Krym', 'UA.71': 'Cherkaska oblast', 'UA.74': 'Chernihivska oblast', 'UA.77': 'Chernivetska oblast', 'UA.12': 'Dnipropetrovska oblast', 'UA.14': 'Donetska oblast', 'UA.26': 'Ivano-Frankivska oblast', 'UA.63': 'Kharkivska oblast', 'UA.65': 'Khersonska oblast', 'UA.68': 'Khmelnytska oblast', 'UA.35': 'Kirovohradska oblast', 'UA.30': 'Kyiv', 'UA.32': 'Kyivska oblast', 'UA.09': 'Luhanska oblast', 'UA.46': 'Lvivska oblast', 'UA.48': 'Mykolaivska oblast', 'UA.51': 'Odeska oblast', 'UA.53': 'Poltavska oblast', 'UA.56': 'Rivnenska oblast', 'UA.40': 'Sevastopol', 'UA.59': 'Sumska oblast', 'UA.61': 'Ternopilska oblast', 'UA.05': 'Vinnytska oblast', 'UA.07': 'Volynska oblast', 'UA.21': 'Zakarpatska oblast', 'UA.23': 'Zaporizka oblast', 'UA.18': 'Zhytomyrska oblast',
			},
			'UG': {
				'UG.316': 'Amuru', 'UG.303': 'Arua', 'UG.201': 'Bugiri', 'UG.117': 'Buikwe', 'UG.219': 'Bukedea', 'UG.416': 'Buliisa', 'UG.120': 'Buvuma', 'UG.304': 'Gulu', 'UG.403': 'Hoima', 'UG.203': 'Iganga', 'UG.204': 'Jinja', 'UG.404': 'Kabale', 'UG.405': 'Kabarole', 'UG.101': 'Kalangala', 'UG.222': 'Kaliro', 'UG.122': 'Kalungu', 'UG.102': 'Kampala', 'UG.205': 'Kamuli', 'UG.406': 'Kasese', 'UG.112': 'Kayunga', 'UG.407': 'Kibaale', 'UG.103': 'Kiboga', 'UG.419': 'Kiruhura', 'UG.208': 'Kumi', 'UG.415': 'Kyenjojo', 'UG.307': 'Lira', 'UG.104': 'Luwero', 'UG.105': 'Masaka', 'UG.214': 'Mayuge', 'UG.209': 'Mbale', 'UG.410': 'Mbarara', 'UG.115': 'Mityana', 'UG.106': 'Mpigi', 'UG.107': 'Mubende', 'UG.108': 'Mukono', 'UG.116': 'Nakaseke', 'UG.328': 'Nwoya', 'UG.321': 'Oyam', 'UG.210': 'Pallisa', 'UG.412': 'Rukungiri', 'UG.215': 'Sironko', 'UG.211': 'Soroti', 'UG.113': 'Wakiso',
			},
			'UM': {
				'UM.95': 'Palmyra Atoll',
			},
			'US': {
				'US.AL': 'Alabama', 'US.AK': 'Alaska', 'US.AZ': 'Arizona', 'US.AR': 'Arkansas', 'US.CA': 'California', 'US.CO': 'Colorado', 'US.CT': 'Connecticut', 'US.DE': 'Delaware', 'US.DC': 'District of Columbia', 'US.FL': 'Florida', 'US.GA': 'Georgia', 'US.HI': 'Hawaii', 'US.ID': 'Idaho', 'US.IL': 'Illinois', 'US.IN': 'Indiana', 'US.IA': 'Iowa', 'US.KS': 'Kansas', 'US.KY': 'Kentucky', 'US.LA': 'Louisiana', 'US.ME': 'Maine', 'US.MD': 'Maryland', 'US.MA': 'Massachusetts', 'US.MI': 'Michigan', 'US.MN': 'Minnesota', 'US.MS': 'Mississippi', 'US.MO': 'Missouri', 'US.MT': 'Montana', 'US.NE': 'Nebraska', 'US.NV': 'Nevada', 'US.NH': 'New Hampshire', 'US.NJ': 'New Jersey', 'US.NM': 'New Mexico', 'US.NY': 'New York', 'US.NC': 'North Carolina', 'US.ND': 'North Dakota', 'US.OH': 'Ohio', 'US.OK': 'Oklahoma', 'US.OR': 'Oregon', 'US.PA': 'Pennsylvania', 'US.RI': 'Rhode Island', 'US.SC': 'South Carolina', 'US.SD': 'South Dakota', 'US.TN': 'Tennessee', 'US.TX': 'Texas', 'US.UT': 'Utah', 'US.VT': 'Vermont', 'US.VA': 'Virginia', 'US.WA': 'Washington', 'US.WV': 'West Virginia', 'US.WI': 'Wisconsin', 'US.WY': 'Wyoming',
			},
			'UY': {
				'UY.AR': 'Artigas', 'UY.CA': 'Canelones', 'UY.CL': 'Cerro Largo', 'UY.CO': 'Colonia', 'UY.DU': 'Durazno', 'UY.FS': 'Flores', 'UY.FD': 'Florida', 'UY.LA': 'Lavalleja', 'UY.MA': 'Maldonado', 'UY.MO': 'Montevideo', 'UY.PA': 'Paysandu', 'UY.RN': 'Rio Negro', 'UY.RV': 'Rivera', 'UY.RO': 'Rocha', 'UY.SA': 'Salto', 'UY.SJ': 'San Jose', 'UY.SO': 'Soriano', 'UY.TA': 'Tacuarembo', 'UY.TT': 'Treinta y Tres',
			},
			'UZ': {
				'UZ.AN': 'Andijon', 'UZ.BU': 'Buxoro', 'UZ.FA': 'Farg\'ona', 'UZ.JI': 'Jizzax', 'UZ.NG': 'Namangan', 'UZ.NW': 'Navoiy', 'UZ.QA': 'Qashqadaryo', 'UZ.QR': 'Qoraqalpog\'iston Respublikasi', 'UZ.SA': 'Samarqand', 'UZ.SI': 'Sirdaryo', 'UZ.SU': 'Surxondaryo', 'UZ.TK': 'Toshkent', 'UZ.XO': 'Xorazm',
			},
			'VC': {
				'VC.01': 'Charlotte', 'VC.06': 'Grenadines', 'VC.03': 'Saint David', 'VC.04': 'Saint George', 'VC.05': 'Saint Patrick',
			},
			'VE': {
				'VE.Z': 'Amazonas', 'VE.B': 'Anzoategui', 'VE.C': 'Apure', 'VE.D': 'Aragua', 'VE.E': 'Barinas', 'VE.F': 'Bolivar', 'VE.G': 'Carabobo', 'VE.H': 'Cojedes', 'VE.Y': 'Delta Amacuro', 'VE.A': 'Distrito Capital', 'VE.I': 'Falcon', 'VE.J': 'Guarico', 'VE.K': 'Lara', 'VE.L': 'Merida', 'VE.M': 'Miranda', 'VE.N': 'Monagas', 'VE.O': 'Nueva Esparta', 'VE.P': 'Portuguesa', 'VE.R': 'Sucre', 'VE.S': 'Tachira', 'VE.T': 'Trujillo', 'VE.X': 'Vargas', 'VE.U': 'Yaracuy', 'VE.V': 'Zulia',
			},
			'VN': {
				'VN.44': 'An Giang', 'VN.43': 'Ba Ria - Vung Tau', 'VN.54': 'Bac Giang', 'VN.53': 'Bac Kan', 'VN.55': 'Bac Lieu', 'VN.56': 'Bac Ninh', 'VN.50': 'Ben Tre', 'VN.31': 'Binh Dinh', 'VN.57': 'Binh Duong', 'VN.58': 'Binh Phuoc', 'VN.40': 'Binh Thuan', 'VN.59': 'Ca Mau', 'VN.CT': 'Can Tho', 'VN.04': 'Cao Bang', 'VN.DN': 'Da Nang', 'VN.33': 'Dak Lak', 'VN.72': 'Dak Nong', 'VN.71': 'Dien Bien', 'VN.39': 'Dong Nai', 'VN.45': 'Dong Thap', 'VN.30': 'Gia Lai', 'VN.03': 'Ha Giang', 'VN.63': 'Ha Nam', 'VN.HN': 'Ha Noi', 'VN.23': 'Ha Tinh', 'VN.61': 'Hai Duong', 'VN.HP': 'Hai Phong', 'VN.SG': 'Ho Chi Minh', 'VN.14': 'Hoa Binh', 'VN.66': 'Hung Yen', 'VN.34': 'Khanh Hoa', 'VN.47': 'Kien Giang', 'VN.28': 'Kon Tum', 'VN.01': 'Lai Chau', 'VN.35': 'Lam Dong', 'VN.09': 'Lang Son', 'VN.02': 'Lao Cai', 'VN.41': 'Long An', 'VN.67': 'Nam Dinh', 'VN.22': 'Nghe An', 'VN.18': 'Ninh Binh', 'VN.36': 'Ninh Thuan', 'VN.68': 'Phu Tho', 'VN.32': 'Phu Yen', 'VN.24': 'Quang Binh', 'VN.27': 'Quang Nam', 'VN.29': 'Quang Ngai', 'VN.13': 'Quang Ninh', 'VN.25': 'Quang Tri', 'VN.52': 'Soc Trang', 'VN.05': 'Son La', 'VN.37': 'Tay Ninh', 'VN.20': 'Thai Binh', 'VN.69': 'Thai Nguyen', 'VN.21': 'Thanh Hoa', 'VN.26': 'Thua Thien-Hue', 'VN.46': 'Tien Giang', 'VN.51': 'Tra Vinh', 'VN.07': 'Tuyen Quang', 'VN.49': 'Vinh Long', 'VN.70': 'Vinh Phuc', 'VN.06': 'Yen Bai',
			},
			'VU': {
				'VU.SEE': 'Shefa', 'VU.TAE': 'Tafea',
			},
			'WF': {
				'WF.SG': 'Sigave', 'WF.UV': 'Uvea',
			},
			'WS': {
				'WS.FA': 'Fa\'asaleleaga', 'WS.TU': 'Tuamasaga',
			},
			'YE': {
				'YE.AD': '\'Adan', 'YE.AM': '\'Amran', 'YE.AB': 'Abyan', 'YE.DA': 'Ad Dali\'', 'YE.BA': 'Al Bayda\'', 'YE.HU': 'Al Hudaydah', 'YE.JA': 'Al Jawf', 'YE.MR': 'Al Mahrah', 'YE.MW': 'Al Mahwit', 'YE.SA': 'Amanat al \'Asimah', 'YE.DH': 'Dhamar', 'YE.HD': 'Hadramawt', 'YE.IB': 'Ibb', 'YE.LA': 'Lahij', 'YE.MA': 'Ma\'rib', 'YE.SD': 'Sa\'dah', 'YE.SN': 'San\'a\'', 'YE.SH': 'Shabwah', 'YE.TA': 'Ta\'izz',
			},
			'ZA': {
				'ZA.EC': 'Eastern Cape', 'ZA.FS': 'Free State', 'ZA.GT': 'Gauteng', 'ZA.NL': 'Kwazulu-Natal', 'ZA.LP': 'Limpopo', 'ZA.MP': 'Mpumalanga', 'ZA.NW': 'North-West', 'ZA.NC': 'Northern Cape', 'ZA.WC': 'Western Cape',
			},
			'ZM': {
				'ZM.02': 'Central', 'ZM.08': 'Copperbelt', 'ZM.03': 'Eastern', 'ZM.04': 'Luapula', 'ZM.09': 'Lusaka', 'ZM.06': 'North-Western', 'ZM.05': 'Northern', 'ZM.07': 'Southern', 'ZM.01': 'Western',
			},
			'ZW': {
				'ZW.BU': 'Bulawayo', 'ZW.HA': 'Harare', 'ZW.MA': 'Manicaland', 'ZW.MC': 'Mashonaland Central', 'ZW.ME': 'Mashonaland East', 'ZW.MW': 'Mashonaland West', 'ZW.MV': 'Masvingo', 'ZW.MN': 'Matabeleland North', 'ZW.MS': 'Matabeleland South', 'ZW.MI': 'Midlands',
			},
		};

        var http_codes = {
            "301": "301 Permanently Redirect",
            "302": "302 Temporary Redirect"
        };
        var exclude = false;
        var keep_query = false;

        var page_list = '<optgroup label="Pages">';
        $.each(pages, function(i, row) {
            page_list += '<option value="' + row.page_id + '">' + row.page_title + '</option>';
        });
        page_list += '</optgroup>';

        var post_list = '<optgroup label="Posts">';
        $.each(posts, function(i, row) {
            post_list += '<option value="' + row.post_id + '">' + row.post_title + '</option>';
        });
        post_list += '</optgroup>';

        var $country_list = $('<select data-placeholder="Choose Country..." class="chosen" multiple>').on('change', function() {
            $(this).parent().find('.country-codes').remove();

			if ($(this).val()) {
				var countries = [];
				var regions = [];
				var list = [];

				$.each($(this).val(), function(i, code) {
					if (code.indexOf('.') > -1) {
						regions.push(code);
					} else {
						countries.push(code);
					}
				});

				if (countries.length) {
					$.each(countries, function(i, country) {
						list.push(country);

						if (regions.length) {
							for( var i = 0; i < regions.length; i++){ 
								if (regions[i].substr(0, 2) == country) {
									regions.splice(i, 1); 
									i--;
								}
							}
						}
					});

					if (regions.length) {
						$.each(regions, function(i, region) {
							list.push(region);
						});
					}

					$(this).val(list);
					$('.chosen').trigger('chosen:updated');
				}

				$(this).parent().find('.country_codes').val($(this).val().filter(function(s) {
					return (s != '');
				}).join(';'));
			}
        });

		var codes = country_codes.split(';');

		$.each(codes, function(i, code) {
			if (code.substr(0, 1) == '-') {
				 exclude = true;
				 codes[i] = code.substr(1);
			}
		});

        $.each(countries, function(iso_code, country_name) {
            $country_list.append('<option value="' + iso_code + '"' + ((codes.indexOf(iso_code) != -1) ? ' selected' : '') + '>' + country_name + '</option>');

			if ($('#enable_region_redirection').val() == 'true') {
				if (typeof regions[iso_code] != 'undefined') {
					$.each(regions[iso_code], function(region_code, region_name) {
						$country_list.append('<option value="' + region_code + '"' + ((codes.indexOf(region_code) != -1) ? ' selected' : '') + '>' + country_name + ' - ' + region_name + '</option>');
					});
				}
			}
        });

        var $exclude_input = $('<input type="hidden" name="exclude[]" class="exclude-input" value="' + (exclude ? '1' : '0') + '">');

        var $exclude_checkbox = $('<input type="checkbox" class="exclude-checkbox"' + ((exclude) ? ' checked' : '') + '>');
        $exclude_checkbox.on('change', function() {
            $(this).parent().find('.exclude-input').val(($(this).is(':checked')) ? 1 : 0);
        });

        var $from_list = $('<select name="from[]" data-placeholder="Choose Page..." class="chosen redirect-from">')
            .on('chosen:ready', function() {
                $(this).attr('data-prev', $(this).val());
            })
            .on('chosen:showing_dropdown', function() {
                $(this).attr('data-prev', $(this).val());
            })
            .on('change', function() {
                if ($(this).val() != 'url' && $(this).val() != 'domain' && $(this).val() == $(this).parent().next().children().val()) {
                    alert('The value of [From] and [Destination] cannot be same.');
                    $(this).val('');
                    $('.chosen').trigger('chosen:updated');
                    return;
                }

                if ($(this).attr('data-prev') == 'domain') {
                    $(this).parent().parent().find('.redirect-to').val('');
                    $(this).parent().parent().find('.domain-container').slideUp('fast');
                    $('.chosen').trigger('chosen:updated');
                }

				if ($(this).val() == 'url') {
					$(this).parent().find('.url-container').slideDown();
                    $(this).parent().find('.domain-container').slideUp('fast');

				} else if ($(this).val() == 'domain') {
                    $(this).parent().parent().find('.domain-container').slideDown();
                    $(this).parent().parent().find('.url-container').slideUp('fast');

					$(this).parent().parent().find('.redirect-to').val('domain');
                    $('.chosen').trigger('chosen:updated');

                } else {
					 $(this).parent().find('.url-container').slideUp('fast');
                     $(this).parent().find('.domain-container').slideUp('fast');
                }
            })
            .append('<option value=""></option>')
            .append('<option value="any"> [Any Page]</option>')
            .append('<option value="home"> [Home Page]</option>')
            .append('<option value="url"> [Enter URL]</option>')
            .append('<option value="domain"> [Enter Domain]</option>')
            .append(page_list)
            .append(post_list);

        var $destination_list = $('<select name="to[]" data-placeholder="Choose Destination..." class="chosen redirect-to">')
            .on('chosen:ready', function() {
                $(this).attr('data-prev', $(this).val());
            })
            .on('chosen:showing_dropdown', function() {
                $(this).attr('data-prev', $(this).val());
            })
            .on('change', function() {
                if ($(this).val() != 'url' && $(this).val() != 'domain' && $(this).val() == $(this).parent().prev().children().val()) {
                    alert('The value of [From] and [Destination] cannot be same.');
                    $(this).val('');
                    $('.chosen').trigger('chosen:updated');
                    return;
                }

                if ($(this).attr('data-prev') == 'domain') {
                    $(this).parent().parent().find('.redirect-from').val('');
                    $(this).parent().parent().find('.domain-container').slideUp('fast');
                    $('.chosen').trigger('chosen:updated');
                }

				if ($(this).val() == 'url') {
					$(this).parent().find('.url-container').slideDown();
					$(this).parent().find('.domain-container').slideUp('fast');

				} else if ($(this).val() == 'domain') {
                    $(this).parent().parent().find('.domain-container').slideDown();
                    $(this).parent().parent().find('.url-container').slideUp('fast');

					$(this).parent().parent().find('.redirect-from').val('domain');
                    $('.chosen').trigger('chosen:updated');

                } else {
                    $(this).parent().find('.url-container').slideUp('fast');
					$(this).parent().find('.domain-container').slideUp('fast');
                }
            })
            .append('<option value=""></option>')
            .append('<option value="url"> [Enter URL]</option>')
            .append('<option value="domain"> [Enter Domain]</option>')
            .append(page_list)
            .append(post_list);

        var $http_code_list = $('<select name="status_code[]"  data-placeholder="Choose Redirection..." class="chosen http-code">');

        $.each(http_codes, function(code, code_name) {
            $http_code_list.append('<option value="' + code + '"' + ((code == http_code) ? ' selected' : '') + '>' + code_name + '</option>');
        });

        $from_list.find('option[value="' + from + '"]').attr('selected', '');
        $destination_list.find('option[value="' + to + '"]').attr('selected', '');

        if (from == 'domain') {
            if (url_from.substr(0, 1) == '*') {
                keep_query = true;
                url_from = url_from.substr(1);
            }
        }

        var $rule = $('<tr>')
            .append($('<td>').append($country_list).append('<input type="hidden" name="country_codes[]" value="' + country_codes + '" class="country_codes">').append($('<p />').append($('<label />').append($exclude_checkbox).append($exclude_input).append(' Redirect all <strong>except</strong> countries & regions listed above.'))))
            .append($('<td>').append($from_list).append('<div class="url-container" style="display:' + ((from == 'url') ? 'block' : 'none') + '"><input type="text" name="url_from[]" value="' + url_from + '" class="url regular-text" maxlength="255" /></div>').append('<div class="domain-container" style="display:' + ((from == 'domain') ? 'block' : 'none') + '"><input type="text" name="domain_from[]" value="' + url_from + '" class="domain regular-text" maxlength="255" /><label><input type="checkbox" name="keep_query[]"' + ((keep_query) ? ' checked' : '') + ' /> Keep query string.</label></div>'))
            .append($('<td>').append($destination_list).append('<div class="url-container" style="display:' + ((to == 'url') ? 'block' : 'none') + '"><input type="text" name="url_to[]" value="' + url_to + '" class="url regular-text" maxlength="255" /></div>').append('<div class="domain-container" style="display:' + ((to == 'domain') ? 'block' : 'none') + '"><input type="text" name="domain_to[]" value="' + url_to + '" class="domain regular-text" maxlength="255" /></div>'))
            .append($('<td>').append($http_code_list))
            .append($('<td>').append('<a href="javascript:;" class="button-rule-action"></a>'));

        $('#rules').append($rule);

        $('.chosen').chosen({
            disable_search_threshold: 5,
            width: 240,
        });

        $('#rules .button-rule-action').attr('class', 'button-rule-action button-remove-rule').off('click').on('click', function(e) {
            e.preventDefault();
            $(this).parent().parent().remove();
            promptSave = true;
        });

        $('#rules tr:last-child').find('.button-rule-action').attr('class', 'button-rule-action button-add-rule').off('click').on('click', function(e) {
            e.preventDefault();
            insert_rule('', '', '', '', '', 301);
        });
    }

    function load_rules() {
        if (typeof(rules) !== 'undefined') {
            $.each(rules, function(i, row) {
                if (row.length == 5) {
                    insert_rule(row[0], row[1], row[2], '', row[3], row[4]);
                } else {
                    insert_rule(row[0], row[1], row[2], row[3], row[4], row[5]);
                }
            });
            insert_rule('', '', '', '', '', 301);
        }
    }

    function refresh_settings() {
        if ($('#lookup_mode_bin').is(':checked')) {
            $('#bin_database').show();
            $('#ws_access').hide();
        } else {
            $('#bin_database').hide();
            $('#ws_access').show();
        }
    }
});