<?php

/**
 * Comments Work plugin for Craft CMS 3.x
 *
 * An easy to use comment plugin for Craft CMS 3
 *
 * @link      https://www.24hoursmedia.com
 * @copyright Copyright (c) 2018 24hoursmedia
 */

namespace modules\kanbanmodule\controllers;


use Craft;
use craft\web\Controller;
use yii\web\BadRequestHttpException;
use yii\web\Response;


class BoardController extends Controller
{


    public function actionAdd(): Response
    {

        if (Craft::$app->request->acceptsJson) {
            return $this->asJson([
                'success' => true,
            ]);
        }
    }

    public function actionUpdate(): Response
    {

        if (Craft::$app->request->acceptsJson) {
            return $this->asJson([
                'success' => true,
            ]);
        }
    }

    public function actionDelete(): Response
    {

        if (Craft::$app->request->acceptsJson) {
            return $this->asJson([
                'success' => true,
            ]);
        }
    }

    public function actionOrder(): Response
    {

        if (Craft::$app->request->acceptsJson) {
            return $this->asJson([
                'success' => true,
            ]);
        }
    }
}
