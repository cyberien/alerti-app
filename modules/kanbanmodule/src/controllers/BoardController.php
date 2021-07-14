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
use craft\elements\Category;
use craft\elements\Entry;
use craft\web\Controller;
use yii\web\BadRequestHttpException;
use yii\web\ForbiddenHttpException;
use yii\web\Response;


class BoardController extends Controller
{


    public function actionAdd(): Response
    {

        $request = Craft::$app->getRequest();

        // Get the related board
        $workspaceId = $request->getValidatedBodyParam('workspaceId');
        $currentWorkspace = Category::find()->id($workspaceId)->anyStatus()->one();

        if (!$currentWorkspace) {
            throw new BadRequestHttpException('Invalid workspace ID: ' . $workspaceId);
        }

        // Save the new card
        $section = Craft::$app->sections->getSectionByHandle('board');
        $entryTypes = $section->getEntryTypes();
        $entryType = $entryTypes[0];

        $entry = new Entry();
        $entry->authorId = Craft::$app->getUser()->id;
        $entry->sectionId = $section->id;
        $entry->typeId = $entryType->id;
        $entry->enabled = true;
        $entry->title = $request->getValidatedBodyParam('title');
        $entry->setFieldValues([
            'workspace' => [$currentWorkspace->id]
        ]);

        $success = Craft::$app->elements->saveElement($entry);

        return $this->asJson([
            'success' => $success,
        ]);
    }

    public function actionSave(): Response
    {

        $request = Craft::$app->getRequest();

        // Get the related board
        $entryId = $request->getValidatedBodyParam('boardId');

        $entry = Entry::find()->id($entryId)->one();

        if (!$entry) {
            throw new BadRequestHttpException('Invalid board ID: ' . $workspaceId);
        }
        
        $entry->title = $request->getValidatedBodyParam('title');

        

        

        $success = Craft::$app->elements->saveElement($entry);

        return $this->asJson([
            'success' => $success,
        ]);
        
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

    public function actionPosition(): Response
    {

        $request = Craft::$app->getRequest();

        // Get the related board
        $entryId = $request->getValidatedBodyParam('boardId');

        $entry = Entry::find()->id($entryId)->one();

        if (!$entry) {
            throw new BadRequestHttpException('Invalid board ID: ' . $workspaceId);
        }

        $entry->position = intval($request->getValidatedBodyParam('position'));

        $success = Craft::$app->elements->saveElement($entry);

        return $this->asJson([
            'success' => $success,
        ]);
    }
}
