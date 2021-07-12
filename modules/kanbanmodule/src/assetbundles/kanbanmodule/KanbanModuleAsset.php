<?php
/**
 * kanban module for Craft CMS 3.x
 *
 * kanban 
 *
 * @link      https://github.com/aminembarki
 * @copyright Copyright (c) 2021 Amine Mbarki
 */

namespace modules\kanbanmodule\assetbundles\kanbanmodule;

use Craft;
use craft\web\AssetBundle;
use craft\web\assets\cp\CpAsset;

/**
 * @author    Amine Mbarki
 * @package   KanbanModule
 * @since     1.0.0
 */
class KanbanModuleAsset extends AssetBundle
{
    // Public Methods
    // =========================================================================

    /**
     * @inheritdoc
     */
    public function init()
    {
        $this->sourcePath = "@modules/kanbanmodule/assetbundles/kanbanmodule/dist";

        $this->depends = [
            CpAsset::class,
        ];

        $this->js = [
            'js/KanbanModule.js',
        ];

        $this->css = [
            'css/KanbanModule.css',
        ];

        parent::init();
    }
}
