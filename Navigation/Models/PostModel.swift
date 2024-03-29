//
//  Posts.swift
//  Navigation
//
//  Created by Roman Romanov on 18.02.2023.
//

import UIKit

struct PostModel {
    var author: String
    var description: String
    var image: String
    var likes: Int
    var views: Int
    
    static func makePostModel() -> [PostModel] {
        var model = [PostModel]()
        model.append(PostModel(author: "Лингвини | Слова и Речь", description: "Вжик. Нет, речь, конечно же, не о персонаже мультфильма «Чип и Дейл спешат на помощь». Так в Хабаровском крае зовут обычного овода. А прозвали его так за то, что он гоняет летом коров и скотину: «вжик под хвост попал»!", image: "Post_1", likes: 89, views: 100))
        model.append(PostModel(author: "Лингвини | Слова и Речь", description: "ХодАтайство или ходатАйство? Как правильно? Ходатайство — документ, содержащий просьбу о чём-либо, представление с целью добиться чего-либо. В издании «Русское словесное ударение» М.В. Зарвы отмечено, что корректным употреблением существительного является «ходАтайство», отдельно указано: «не ходатАйство». Слово с ударением на третий слог можно считать профессиональным жаргоном в юридической среде, но факт остаётся фактом: правильно говорить только ходАтайство.", image: "Post_2", likes: 300, views: 498))
        model.append(PostModel(author: "Лингвини | Слова и Речь", description: "За одного битого двух небитых дают, да и то не берут. За одного битого двух небитых дают. Смысл пословицы — один опытный человек предпочтительней двух новичков. Слово «битый»  в этом выражении выступает синонимом словам тёртый, опытный, бывалый. Впрочем, есть у пословицы и продолжение: «... да и то не берут». Так что ценность битого оказывается в итоге ещё больше, чем мы думали изначально.", image: "Post_3", likes: 280, views: 301))
        model.append(PostModel(author: "Лингвини | Слова и Речь", description: "Как часто Вы слышали пословицу: «Забот полон рот»? Обычно её можно услышать, когда у человека много дел, а времени не хватает. Но в оригинальной версии пословица имеет продолжение: «…а перекусить нечего». В полной версии пословица приобретает другой смысл: нужно уделять свое внимание более важным задача", image: "Post_4", likes: 100, views: 170))
        
        return model
    }
}
