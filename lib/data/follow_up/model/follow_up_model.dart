class FollowUpModel {
 int? id;
 String? title;
 String? description;
 String? customerName;
 String? type;
 String? status;

 FollowUpModel({
   this.id,
   this.title,
   this.description,
  this.customerName,
   this.type,
   this.status,
});

 FollowUpModel.fromJson(Map<String, dynamic> json) {
   id = json['id'];
   title = json['title'];
   description = json['description'];
   customerName = json['customerName'];
   type = json['type'];
   status = json['status'];
 }
 Map<String, dynamic> toJson() {
   final Map<String, dynamic> data = <String, dynamic>{};
   data['id'] = id;
   data['title'] = title;
   data['description'] = description;
   data['customerName'] = customerName;
   data['type'] = type;
   data['status'] = status;

   return data;
 }
}
