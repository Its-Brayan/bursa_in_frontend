class HelpModel{
  String? help_text;

  HelpModel({this.help_text});

  Map<String,dynamic> toJson(){
    return{
      "text":help_text
    };
  }
}