var OxOb67a=["","removeNode","parentNode","firstChild","nodeName","TABLE","length","Can\x27t Get The Position ?","Map","RowCount","ColCount","rows","cells","Unknown Error , pos ",":"," already have cell","rowSpan","colSpan","Unknown Error , Unable to find bestpos","inp_cellspacing","inp_cellpadding","inp_id","inp_border","inp_bgcolor","inp_bordercolor","sel_rules","inp_collapse","inp_summary","btn_editcaption","btn_delcaption","btn_insthead","btn_instfoot","inp_class","inp_width","sel_width_unit","inp_height","sel_height_unit","sel_align","sel_textalign","sel_float","inp_tooltip","onclick","tHead","tFoot","caption","innerHTML","[[Caption]]","innerText","Unable to delete the caption. Please remove it in HTML source.","[[Delete]]","[[Insert]]","[[Edit]]","display","style","none","disabled","specified","nodeValue","cellSpacing","value","cellPadding","id","border","borderColor","backgroundColor","bgColor","borderCollapse","checked","collapse","rules","summary","className","width","options","selectedIndex","height","align","styleFloat","textAlign","title","[[ValidID]]","0","%","class","CaptionTable"]; function ParseFloatToString(Ox24){var Oxe=parseFloat(Ox24);if(isNaN(Oxe)){return OxOb67a[0x0];} ;return Oxe+OxOb67a[0x0];}  ; function Element_RemoveNode(element,Ox3fe){if(element[OxOb67a[0x1]]){ element.removeNode(Ox3fe) ;return ;} ;var p=element[OxOb67a[0x2]];if(!p){return ;} ;if(Ox3fe){ p.removeChild(element) ;return ;} ;while(true){var Ox1c6=element[OxOb67a[0x3]];if(!Ox1c6){break ;} ; p.insertBefore(Ox1c6,element) ;} ; p.removeChild(element) ;}  ; function Table_GetTable(Oxb0){for(;Oxb0!=null;Oxb0=Oxb0[OxOb67a[0x2]]){if(Oxb0[OxOb67a[0x4]]==OxOb67a[0x5]){return Oxb0;} ;} ;return null;}  ; function Table_GetCellPositionFromMap(Ox3f8,Ox28b){for(var Ox2f=0x0;Ox2f<Ox3f8[OxOb67a[0x6]];Ox2f++){var Ox3fb=Ox3f8[Ox2f];for(var Ox30=0x0;Ox30<Ox3fb[OxOb67a[0x6]];Ox30++){if(Ox3fb[Ox30]==Ox28b){return {rowIndex:Ox2f,cellIndex:Ox30};} ;} ;} ;throw ( new Error(-0x1,OxOb67a[0x7]));}  ; function Table_GetCellMap(Ox289){return Table_CalculateTableInfo(Ox289)[OxOb67a[0x8]];}  ; function Table_GetRowCount(Oxb0){return Table_CalculateTableInfo(Oxb0)[OxOb67a[0x9]];}  ; function Table_GetColCount(Oxb0){return Table_CalculateTableInfo(Oxb0)[OxOb67a[0xa]];}  ; function Table_CalculateTableInfo(Oxb0){var Ox289=Table_GetTable(Oxb0);var Ox40b=Ox289[OxOb67a[0xb]];for(var Oxf=Ox40b[OxOb67a[0x6]]-0x1;Oxf>=0x0;Oxf--){var Ox279=Ox40b.item(Oxf);if(Ox279[OxOb67a[0xc]][OxOb67a[0x6]]==0x0){ Element_RemoveNode(Ox279,true) ;continue ;} ;} ;var Ox40c=Ox40b[OxOb67a[0x6]];var Ox40d=0x0;var Ox40e= new Array(Ox40b.length);for(var Ox40f=0x0;Ox40f<Ox40c;Ox40f++){ Ox40e[Ox40f]=[] ;} ; function Ox410(Oxf,Ox1c6,Ox28b){while(Oxf>=Ox40c){ Ox40e[Ox40c]=[] ; Ox40c++ ;} ;var Ox411=Ox40e[Oxf];if(Ox1c6>=Ox40d){ Ox40d=Ox1c6+0x1 ;} ;if(Ox411[Ox1c6]!=null){throw ( new Error(-0x1,OxOb67a[0xd]+Oxf+OxOb67a[0xe]+Ox1c6+OxOb67a[0xf]));} ; Ox411[Ox1c6]=Ox28b ;}  ; function Ox412(Oxf,Ox1c6){var Ox411=Ox40e[Oxf];if(Ox411){return Ox411[Ox1c6];} ;}  ;for(var Ox40f=0x0;Ox40f<Ox40b[OxOb67a[0x6]];Ox40f++){var Ox279=Ox40b.item(Ox40f);var Ox413=Ox279[OxOb67a[0xc]];for(var Ox290=0x0;Ox290<Ox413[OxOb67a[0x6]];Ox290++){var Ox28b=Ox413.item(Ox290);var Ox414=Ox28b[OxOb67a[0x10]];var Ox415=Ox28b[OxOb67a[0x11]];var Ox411=Ox40e[Ox40f];var Ox416=-0x1;for(var Ox417=0x0;Ox417<Ox40d+Ox415+0x1;Ox417++){if(Ox414==0x1&&Ox415==0x1){if(Ox411[Ox417]==null){ Ox416=Ox417 ;break ;} ;} else {var Ox418=true;for(var Ox419=0x0;Ox419<Ox414;Ox419++){for(var Ox41a=0x0;Ox41a<Ox415;Ox41a++){if(Ox412(Ox40f+Ox419,Ox417+Ox41a)!=null){ Ox418=false ;break ;} ;} ;} ;if(Ox418){ Ox416=Ox417 ;break ;} ;} ;} ;if(Ox416==-0x1){throw ( new Error(-0x1,OxOb67a[0x12]));} ;if(Ox414==0x1&&Ox415==0x1){ Ox410(Ox40f,Ox416,Ox28b) ;} else {for(var Ox419=0x0;Ox419<Ox414;Ox419++){for(var Ox41a=0x0;Ox41a<Ox415;Ox41a++){ Ox410(Ox40f+Ox419,Ox416+Ox41a,Ox28b) ;} ;} ;} ;} ;} ;var Ox330={}; Ox330[OxOb67a[0x9]]=Ox40c ; Ox330[OxOb67a[0xa]]=Ox40d ; Ox330[OxOb67a[0x8]]=Ox40e ;for(var Oxf=0x0;Oxf<Ox40c;Oxf++){var Ox411=Ox40e[Oxf];for(var Ox1c6=0x0;Ox1c6<Ox40d;Ox1c6++){} ;} ;return Ox330;}  ;var inp_cellspacing=Window_GetElement(window,OxOb67a[0x13],true);var inp_cellpadding=Window_GetElement(window,OxOb67a[0x14],true);var inp_id=Window_GetElement(window,OxOb67a[0x15],true);var inp_border=Window_GetElement(window,OxOb67a[0x16],true);var inp_bgcolor=Window_GetElement(window,OxOb67a[0x17],true);var inp_bordercolor=Window_GetElement(window,OxOb67a[0x18],true);var sel_rules=Window_GetElement(window,OxOb67a[0x19],true);var inp_collapse=Window_GetElement(window,OxOb67a[0x1a],true);var inp_summary=Window_GetElement(window,OxOb67a[0x1b],true);var btn_editcaption=Window_GetElement(window,OxOb67a[0x1c],true);var btn_delcaption=Window_GetElement(window,OxOb67a[0x1d],true);var btn_insthead=Window_GetElement(window,OxOb67a[0x1e],true);var btn_instfoot=Window_GetElement(window,OxOb67a[0x1f],true);var inp_class=Window_GetElement(window,OxOb67a[0x20],true);var inp_width=Window_GetElement(window,OxOb67a[0x21],true);var sel_width_unit=Window_GetElement(window,OxOb67a[0x22],true);var inp_height=Window_GetElement(window,OxOb67a[0x23],true);var sel_height_unit=Window_GetElement(window,OxOb67a[0x24],true);var sel_align=Window_GetElement(window,OxOb67a[0x25],true);var sel_textalign=Window_GetElement(window,OxOb67a[0x26],true);var sel_float=Window_GetElement(window,OxOb67a[0x27],true);var inp_tooltip=Window_GetElement(window,OxOb67a[0x28],true); function insertOneRow(Ox4ee,Ox302){var Ox279=Ox4ee.insertRow(-0x1);for(var i=0x0;i<Ox302;i++){ Ox279.insertCell() ;} ;}  ; btn_insthead[OxOb67a[0x29]]=function btn_insthead_onclick(){if(element[OxOb67a[0x2a]]){ element.deleteTHead() ;} else {var Ox4f0=Table_GetColCount(element);var Ox4f1=element.createTHead(); insertOneRow(Ox4f1,Ox4f0) ;} ;}  ; btn_instfoot[OxOb67a[0x29]]=function btn_instfoot_onclick(){if(element[OxOb67a[0x2b]]){ element.deleteTFoot() ;} else {var Ox4f0=Table_GetColCount(element);var Ox4f3=element.createTFoot(); insertOneRow(Ox4f3,Ox4f0) ;} ;}  ; btn_editcaption[OxOb67a[0x29]]=function btn_editcaption_onclick(){var Ox4f5=element[OxOb67a[0x2c]];if(Ox4f5!=null){var Ox98=editor.EditInWindow(Ox4f5.innerHTML,window);if(Ox98!=null&&Ox98!=false){ Ox4f5[OxOb67a[0x2d]]=Ox98 ;} ;} else {var Ox4f5=element.createCaption();if(Browser_IsGecko()){ Ox4f5[OxOb67a[0x2d]]=OxOb67a[0x2e] ;} else { Ox4f5[OxOb67a[0x2f]]=OxOb67a[0x2e] ;} ;} ;}  ; btn_delcaption[OxOb67a[0x29]]=function btn_delcaption_onclick(){if(element[OxOb67a[0x2c]]!=null){ alert(OxOb67a[0x30]) ;} ;}  ; UpdateState=function UpdateState_Table(){if(Browser_IsGecko()){ btn_insthead[OxOb67a[0x2d]]=element[OxOb67a[0x2a]]?OxOb67a[0x31]:OxOb67a[0x32] ; btn_instfoot[OxOb67a[0x2d]]=element[OxOb67a[0x2b]]?OxOb67a[0x31]:OxOb67a[0x32] ;} else { btn_insthead[OxOb67a[0x2f]]=element[OxOb67a[0x2a]]?OxOb67a[0x31]:OxOb67a[0x32] ; btn_instfoot[OxOb67a[0x2f]]=element[OxOb67a[0x2b]]?OxOb67a[0x31]:OxOb67a[0x32] ;} ;if(element[OxOb67a[0x2c]]!=null){if(Browser_IsGecko()){ btn_editcaption[OxOb67a[0x2d]]=OxOb67a[0x33] ;} else { btn_editcaption[OxOb67a[0x2f]]=OxOb67a[0x33] ;} ; btn_editcaption[OxOb67a[0x35]][OxOb67a[0x34]]=OxOb67a[0x36] ; btn_delcaption[OxOb67a[0x37]]=false ;} else {if(Browser_IsGecko()){ btn_editcaption[OxOb67a[0x2d]]=OxOb67a[0x32] ;} else { btn_editcaption[OxOb67a[0x2f]]=OxOb67a[0x32] ;} ; btn_delcaption[OxOb67a[0x37]]=true ;} ;}  ;var t_inp_width=OxOb67a[0x0];var t_inp_height=OxOb67a[0x0]; SyncToView=function SyncToView_Table(){ function GetAttribute(Ox30f){var attr=element.getAttributeNode(Ox30f);if(attr==null||!attr[OxOb67a[0x38]]){return OxOb67a[0x0];} ;return attr[OxOb67a[0x39]];}  ; inp_cellspacing[OxOb67a[0x3b]]=GetAttribute(OxOb67a[0x3a]) ; inp_cellpadding[OxOb67a[0x3b]]=GetAttribute(OxOb67a[0x3c]) ; inp_id[OxOb67a[0x3b]]=GetAttribute(OxOb67a[0x3d]) ; inp_border[OxOb67a[0x3b]]=GetAttribute(OxOb67a[0x3e]) ; inp_bordercolor[OxOb67a[0x3b]]=GetAttribute(OxOb67a[0x3f]) ; inp_bordercolor[OxOb67a[0x35]][OxOb67a[0x40]]=inp_bordercolor[OxOb67a[0x3b]] ; inp_bgcolor[OxOb67a[0x3b]]=GetAttribute(OxOb67a[0x41])||element[OxOb67a[0x35]][OxOb67a[0x40]] ; inp_bgcolor[OxOb67a[0x35]][OxOb67a[0x40]]=inp_bgcolor[OxOb67a[0x3b]] ; inp_collapse[OxOb67a[0x43]]=element[OxOb67a[0x35]][OxOb67a[0x42]]==OxOb67a[0x44] ; sel_rules[OxOb67a[0x3b]]=GetAttribute(OxOb67a[0x45]) ; inp_summary[OxOb67a[0x3b]]=GetAttribute(OxOb67a[0x46]) ; inp_class[OxOb67a[0x3b]]=element[OxOb67a[0x47]] ;if(GetAttribute(OxOb67a[0x48])){ t_inp_width=GetAttribute(OxOb67a[0x48]) ;} else {if(element[OxOb67a[0x35]][OxOb67a[0x48]]){ t_inp_width=element[OxOb67a[0x35]][OxOb67a[0x48]] ;} ;} ;if(t_inp_width){ inp_width[OxOb67a[0x3b]]=ParseFloatToString(t_inp_width) ;for(var i=0x0;i<sel_width_unit[OxOb67a[0x49]][OxOb67a[0x6]];i++){var Ox60=sel_width_unit[OxOb67a[0x49]][i][OxOb67a[0x3b]];if(Ox60&&t_inp_width.indexOf(Ox60)!=-0x1){ sel_width_unit[OxOb67a[0x4a]]=i ;break ;} ;} ;} ;if(GetAttribute(OxOb67a[0x4b])){ t_inp_height=GetAttribute(OxOb67a[0x4b]) ;} else {if(element[OxOb67a[0x35]][OxOb67a[0x4b]]){ t_inp_height=element[OxOb67a[0x35]][OxOb67a[0x4b]] ;} ;} ;if(t_inp_height){ inp_height[OxOb67a[0x3b]]=ParseFloatToString(t_inp_height) ;for(var i=0x0;i<sel_height_unit[OxOb67a[0x49]][OxOb67a[0x6]];i++){var Ox60=sel_height_unit[OxOb67a[0x49]][i][OxOb67a[0x3b]];if(Ox60&&t_inp_height.indexOf(Ox60)!=-0x1){ sel_height_unit[OxOb67a[0x4a]]=i ;break ;} ;} ;} ; sel_align[OxOb67a[0x3b]]=element[OxOb67a[0x4c]] ; sel_float[OxOb67a[0x3b]]=element[OxOb67a[0x35]][OxOb67a[0x4d]] ; sel_textalign[OxOb67a[0x3b]]=element[OxOb67a[0x35]][OxOb67a[0x4e]] ; inp_tooltip[OxOb67a[0x3b]]=element[OxOb67a[0x4f]] ;}  ; SyncTo=function SyncTo_Table(element){ element[OxOb67a[0x3f]]=inp_bordercolor[OxOb67a[0x3b]] ;if(inp_bgcolor[OxOb67a[0x3b]]){if(element[OxOb67a[0x35]][OxOb67a[0x40]]){ element[OxOb67a[0x35]][OxOb67a[0x40]]=inp_bgcolor[OxOb67a[0x3b]] ;} else { element[OxOb67a[0x41]]=inp_bgcolor[OxOb67a[0x3b]] ;} ;} ; element[OxOb67a[0x35]][OxOb67a[0x42]]=inp_collapse[OxOb67a[0x43]]?OxOb67a[0x44]:OxOb67a[0x0] ; element[OxOb67a[0x45]]=sel_rules[OxOb67a[0x3b]]||OxOb67a[0x0] ; element[OxOb67a[0x46]]=inp_summary[OxOb67a[0x3b]] ; element[OxOb67a[0x47]]=inp_class[OxOb67a[0x3b]] ; element[OxOb67a[0x3a]]=inp_cellspacing[OxOb67a[0x3b]] ; element[OxOb67a[0x3c]]=inp_cellpadding[OxOb67a[0x3b]] ;var Ox268=/[^a-z\d]/i;if(Ox268.test(inp_id.value)){ alert(OxOb67a[0x50]) ;return ;} ; element[OxOb67a[0x3d]]=inp_id[OxOb67a[0x3b]] ;if(inp_border[OxOb67a[0x3b]]==OxOb67a[0x0]){ element[OxOb67a[0x3e]]=OxOb67a[0x51] ;} else { element[OxOb67a[0x3e]]=inp_border[OxOb67a[0x3b]] ;} ;if(inp_width[OxOb67a[0x3b]]==OxOb67a[0x0]){ element.removeAttribute(OxOb67a[0x48]) ; element[OxOb67a[0x35]][OxOb67a[0x48]]=OxOb67a[0x0] ;} else { t_inp_width=inp_width[OxOb67a[0x3b]] ;if(sel_width_unit[OxOb67a[0x3b]]==OxOb67a[0x52]){ t_inp_width=inp_width[OxOb67a[0x3b]]+sel_width_unit[OxOb67a[0x3b]] ;} ;if(element[OxOb67a[0x35]][OxOb67a[0x48]]&&element[OxOb67a[0x48]]){ element[OxOb67a[0x35]][OxOb67a[0x48]]=t_inp_width ; element[OxOb67a[0x48]]=t_inp_width ;} else {if(element[OxOb67a[0x35]][OxOb67a[0x48]]){ element[OxOb67a[0x35]][OxOb67a[0x48]]=t_inp_width ;} else { element[OxOb67a[0x48]]=t_inp_width ;} ;} ;} ;if(inp_height[OxOb67a[0x3b]]==OxOb67a[0x0]){ element.removeAttribute(OxOb67a[0x4b]) ; element[OxOb67a[0x35]][OxOb67a[0x4b]]=OxOb67a[0x0] ;} else { t_inp_height=inp_height[OxOb67a[0x3b]] ;if(sel_height_unit[OxOb67a[0x3b]]==OxOb67a[0x52]){ t_inp_height=inp_height[OxOb67a[0x3b]]+sel_height_unit[OxOb67a[0x3b]] ;} ; t_inp_height=inp_height[OxOb67a[0x3b]]+sel_height_unit[OxOb67a[0x3b]] ;if(element[OxOb67a[0x35]][OxOb67a[0x4b]]&&element[OxOb67a[0x4b]]){ element[OxOb67a[0x35]][OxOb67a[0x4b]]=t_inp_height ; element[OxOb67a[0x4b]]=t_inp_height ;} else {if(element[OxOb67a[0x35]][OxOb67a[0x4b]]){ element[OxOb67a[0x35]][OxOb67a[0x4b]]=t_inp_height ;} else { element[OxOb67a[0x4b]]=t_inp_height ;} ;} ;} ; element[OxOb67a[0x4c]]=sel_align[OxOb67a[0x3b]] ; element[OxOb67a[0x35]][OxOb67a[0x4d]]=sel_float[OxOb67a[0x3b]] ; element[OxOb67a[0x35]][OxOb67a[0x4e]]=sel_textalign[OxOb67a[0x3b]] ; element[OxOb67a[0x4f]]=inp_tooltip[OxOb67a[0x3b]] ;if(element[OxOb67a[0x4f]]==OxOb67a[0x0]){ element.removeAttribute(OxOb67a[0x4f]) ;} ;if(element[OxOb67a[0x46]]==OxOb67a[0x0]){ element.removeAttribute(OxOb67a[0x46]) ;} ;if(element[OxOb67a[0x47]]==OxOb67a[0x0]){ element.removeAttribute(OxOb67a[0x47]) ;} ;if(element[OxOb67a[0x47]]==OxOb67a[0x0]){ element.removeAttribute(OxOb67a[0x53]) ;} ;}  ;if(!Browser_IsWinIE()){ inp_bgcolor[OxOb67a[0x29]]=function inp_bgcolor_onclick(){ SelectColor(inp_bgcolor) ;}  ; inp_bordercolor[OxOb67a[0x29]]=function inp_bordercolor_onclick(){ SelectColor(inp_bordercolor) ;}  ; Window_GetElement(window,OxOb67a[0x54],true)[OxOb67a[0x35]][OxOb67a[0x34]]=OxOb67a[0x36] ;} ;