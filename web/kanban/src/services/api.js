import Config from '../app.config.js';
import axios from 'axios';
import qs from 'qs';


let apiService = {
    getBoards() {

        var api = Config.domain + "boards.json";
        return axios.get(api).then(response => response.data.data);

    },
    getCards(idBoard) {


        var api = Config.domain + "board/" + idBoard + ".json";

        return axios.get(api).then(response => response.data.data);

     
    },
    deleteBoard(id) {

        var api = Config.domain + "actions/kanban-module/board/delete";

        return axios.post(api, qs.stringify({
            entryId: id,
        })).then(response => response.data.data);


    }
}

export default apiService