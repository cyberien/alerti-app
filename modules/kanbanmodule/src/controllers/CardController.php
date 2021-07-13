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


class CardController extends Controller
{


    public function beforeAction($action)
    {
         $user = Craft::$app->getUser();

        if ($user) {
            return parent::beforeAction($action); 
        }

       return false;
    }

    public function actionAdd(): Response
    {

        $request = Craft::$app->getRequest();

        // Get the related board
        $boradId = $request->getValidatedBodyParam('boradId');
        $boradId = 57;
        $currentBorad = Entry::find()->id($boradId)->anyStatus()->one();

        if (!$currentBorad) {
            throw new BadRequestHttpException('Invalid board ID: ' . $boradId);
        }
        
        // Save the new card
        $section = Craft::$app->sections->getSectionByHandle('card');
        $entryTypes = $section->getEntryTypes();
        $entryType = $entryTypes[0];

        $entry = new Entry();
        $entry->authorId = Craft::$app->getUser()->id;
        $entry->sectionId = $section->id;
        $entry->typeId = $entryType->id;
        $entry->enabled = true;
        $entry->title = $request->getValidatedBodyParam('title');
        $entry->setFieldValues([
            'relatedboard'=> [$currentBorad->id]
        ]);
    
        $success = Craft::$app->elements->saveElement($entry);

        return $this->asJson([
            'success' => $success,
        ]);
    }

    public function actionSave(): Response
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

            throw new ForbiddenHttpException('You are not allowed to delete the card  with the ID “'.$entryId.'”.');
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
