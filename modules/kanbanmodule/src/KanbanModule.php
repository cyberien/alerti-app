<?php
/**
 * kanban module for Craft CMS 3.x
 *
 * kanban 
 *
 * @link      https://github.com/aminembarki
 * @copyright Copyright (c) 2021 Amine Mbarki
 */

namespace modules\kanbanmodule;

use modules\kanbanmodule\assetbundles\kanbanmodule\KanbanModuleAsset;

use Craft;
use craft\events\RegisterTemplateRootsEvent;
use craft\events\TemplateEvent;
use craft\i18n\PhpMessageSource;
use craft\web\View;

use yii\base\Event;
use yii\base\InvalidConfigException;
use yii\base\Module;

/**
 * Class KanbanModule
 *
 * @author    Amine Mbarki
 * @package   KanbanModule
 * @since     1.0.0
 *
 */
class KanbanModule extends Module
{
    // Static Properties
    // =========================================================================

    /**
     * @var KanbanModule
     */
    public static $instance;

    // Public Methods
    // =========================================================================

    /**
     * @inheritdoc
     */
    public function __construct($id, $parent = null, array $config = [])
    {
        Craft::setAlias('@modules/kanbanmodule', $this->getBasePath());
        $this->controllerNamespace = 'modules\kanbanmodule\controllers';

        // Translation category
        $i18n = Craft::$app->getI18n();
        /** @noinspection UnSafeIsSetOverArrayInspection */
        if (!isset($i18n->translations[$id]) && !isset($i18n->translations[$id.'*'])) {
            $i18n->translations[$id] = [
                'class' => PhpMessageSource::class,
                'sourceLanguage' => 'en-US',
                'basePath' => '@modules/kanbanmodule/translations',
                'forceTranslation' => true,
                'allowOverrides' => true,
            ];
        }

        // // Base template directory
        // Event::on(View::class, View::EVENT_REGISTER_CP_TEMPLATE_ROOTS, function (RegisterTemplateRootsEvent $e) {
        //     if (is_dir($baseDir = $this->getBasePath().DIRECTORY_SEPARATOR.'templates')) {
        //         $e->roots[$this->id] = $baseDir;
        //     }
        // });

        // Set this as the global instance of this module class
        static::setInstance($this);

        parent::__construct($id, $parent, $config);
    }

    /**
     * @inheritdoc
     */
    public function init()
    {
        parent::init();
        self::$instance = $this;

        if (Craft::$app->getRequest()->getIsCpRequest()) {
            Event::on(
                View::class,
                View::EVENT_BEFORE_RENDER_TEMPLATE,
                function (TemplateEvent $event) {
                    try {
                        Craft::$app->getView()->registerAssetBundle(KanbanModuleAsset::class);
                    } catch (InvalidConfigException $e) {
                        Craft::error(
                            'Error registering AssetBundle - '.$e->getMessage(),
                            __METHOD__
                        );
                    }
                }
            );
        }

        Craft::info(
            Craft::t(
                'kanban-module',
                '{name} module loaded',
                ['name' => 'kanban']
            ),
            __METHOD__
        );
    }

    // Protected Methods
    // =========================================================================
}
