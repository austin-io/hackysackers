extends RichTextLabel

var dialog = ["Welcome to HackySac 2018!", "This is a changing DIALOG BOX!"]
var page = 0

func _ready():
    set_bbcode(dialog[page])
    set_visible_characters(0)
    set_process_input(true)

func _input(event):
    if Input.is_key_pressed(KEY_ENTER): # && event.is_pressed():
        if get_visible_characters() > get_total_character_count():
                if page < dialog.size()-1:
                    page += 1
                    set_bbcode(dialog[page])
                    set_visible_characters(0)
        else:
            set_visible_characters(get_total_character_count())

func _on_Timer_timeout():
    set_visible_characters(get_visible_characters()+1)