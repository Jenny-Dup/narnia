import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "./chat_room"

Rails.start()
Turbolinks.start()
ActiveStorage.start()
