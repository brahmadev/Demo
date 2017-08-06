package demo

class BaseController {

    def index() {}
    def auth(){
        if(!session.user){
            redirect(controller: 'user',action: 'login')
            return false
        }
    }
}
