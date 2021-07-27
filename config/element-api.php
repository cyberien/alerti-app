<?php

use craft\elements\Entry;
use craft\helpers\UrlHelper;

return [
 
    'endpoints' => [  
        'boards.json' => function () {
            return [
                'elementType' => Entry::class,
                'criteria' => ['section' => 'board'],
                'transformer' => function (Entry $entry) {
                    return [
                        'id' => $entry->id,
                        'title' => $entry->title,
                        'url' => $entry->url,
                        'jsonUrl' => UrlHelper::url("board/{$entry->id}.json"),
                        'position' => $entry->position,
                        'workspace' => $entry->workspace,
                    ];
                },
            ];
        },
        'board/<entryId:\d+>.json' => function ($entryId) {
            return [
                'elementType' => Entry::class,
                'criteria' => ['section' => 'card', 'relatedboard' => $entryId],
                'transformer' => function (Entry $entry) {
                    return [
                        'id' => $entry->id,
                        'board' => $entry->relatedboard->one()->id,
                        'title' => $entry->title,
                        'url' => $entry->url,
                        'position' => $entry->position,
                        'jsonUrl' => UrlHelper::url("card/{$entry->id}.json"),
                    ];
                },
            ];
        },
        'card/<entryId:\d+>.json' => function ($entryId) {
            return [
                'cache' => false,
                'elementType' => Entry::class,
                'criteria' => ['id' => $entryId],
                'one' => true,
                'transformer' => function (Entry $entry) {
                    return [
                        'id' => $entry->id,
                        'board' =>  $entry->relatedboard->one()->id,
                        'title' => $entry->title,
                        'url' => $entry->url,
                        'position' => $entry->position,
                        'content' => $entry->redactor,
                    ];
                },
            ];
        },
    ]
];
