<?php
/**
 * alerti module for Craft CMS 3.x
 *
 * alerti
 *
 * @link      https://github.com/aminembarki
 * @copyright Copyright (c) 2021 Amine Mbarki
 */

namespace modules\alertimodule\assetbundles\alertimodule;

use Craft;
use craft\web\AssetBundle;
use craft\web\assets\cp\CpAsset;

/**
 * @author    Amine Mbarki
 * @package   AlertiModule
 * @since     1.0.0
 */
class AlertiModuleAsset extends AssetBundle
{
    // Public Methods
    // =========================================================================

    /**
     * @inheritdoc
     */
    public function init()
    {
        $this->sourcePath = "@modules/alertimodule/assetbundles/alertimodule/dist";

        $this->depends = [
            CpAsset::class,
        ];

        $this->js = [
            'js/AlertiModule.js',
        ];

        $this->css = [
            'css/AlertiModule.css',
        ];

        parent::init();
    }
}
