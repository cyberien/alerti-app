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
use craft\base\Element;
use craft\elements\Entry;
use craft\web\Controller;
use yii\web\BadRequestHttpException;
use yii\web\ForbiddenHttpException;
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

        // $this->requirePostRequest();

        $request = Craft::$app->getRequest();

        $entryId = $request->getValidatedBodyParam('entryId');

        $currentCard = Entry::find()->id($entryId)->one();

        if (!$currentCard) {

            throw new BadRequestHttpException('No card exists');
        }

        if ($currentCard->authorId != Craft::$app->getUser()->id) {

            throw new ForbiddenHttpException('You are not allowed to delete the card  with the ID “' . $entryId . '”.');
        }

        $success = Craft::$app->elements->deleteElementById($currentCard->id);

        return $this->asJson([
            'success' => $success,
        ]);
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
