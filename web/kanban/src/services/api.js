import Config from '../app.config.js';


let apiService = {
    getBoards() {

        var api = Config.domain + "boards.json";
        this.axios.get(api)
            .then((response) => {
                return response.data.data;
            })
            .catch(err => { console.log(err) });

    },
    getCards(idBoard) {
        return new Promise((resolve, reject) => {

            var api = Config.domain + "board/" + idBoard + ".json";
            this.axios.get(api)
                .then((response) => {
                    this.cards = response.data.data;
                })
                .catch(err => { console.log(err) });
        })
    },
    deleteBoard(id) {
        return new Promise((resolve, reject) => {

            var api = Config.domain + "actions/kanban-module/board/delete";
            this.axios.post(api, {
                entryId: id,
                })
                .then((response) => {
                    return  response.data.data;
                })
                .catch(err => { console.log(err) });

            return false;
        })
    }
}

export default apiService