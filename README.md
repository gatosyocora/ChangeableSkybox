# ChangeableSkybox

このシステムはVRChatでVRC_Triggerを使ってSkyboxを切り替えるものです。  
6Sidedにしか対応していません。

著作権は放棄しますので、改造・再配布等ご自由にお使いください。  
また、バグやご意見等がありましたらgatosyocora(Twitter:@gatosyocora)までご連絡ください。

## 内容物
重要なもののみ記載  
- Materials : SampleとかSystemとかに使っている素材たち
 - ChangeableSkybox.shader : ChangeSkyboxのシステムの要1
 - ChangeableSkyboxRT.renderTexture : ChangeSkyboxのシステムの要2
 - Green.mat : 緑色のマテリアル
 - Red.mat : 赤色のマテリアル
- ChangeableSkybox.mat : Skyboxに設定するMaterial
- Sample.unity : 使用例のScene
- SkyboxSystem.prefab : ChangeableSkyboxのシステムの要3

## 導入から設定まで
1. [Release](https://github.com/gatosyocora/ChangeableSkybox/releases)からChangeableSkybox.unitypackageをダウンロードする。
2. Unityで新規プロジェクトを作成し、公式のVRCSDKと1でダウンロードしたものをインポートする。
3. ChangeableSkyboxSystemフォルダ内のChageableSkybox.matで切り替えたい2種類のTextureたちを設定する。
4. UnityのメニューバーからWindow > Lighting > Settingを選択し、EnvironmentのSkybox MaterialにChangeableSkybox.matを設定する。
5. ChangeableSkyboxSystemフォルダ内のSkyboxSystemプレハブをHierarchyにドラッグ&ドロップ(D&D)する。このオブジェクト自体はワールドのいい感じの場所に隠しておいてください。

## 使用方法
任意のオブジェクトのVRC_TriggerからActivateCustomTriggerを実行してください。  
ReceiversにはSkyboxSystemオブジェクトの子にあるSkyboxManagerを設定します。  
そのトリガーで切り替えたいものをNameで選択してください。  
- SetTex1 : ChageableSkybox.matの上部に設定したTextureのSkyboxに切り替わります
- SetTex2 : ChageableSkybox.matの下部に設定したTextureのSkyboxに切り替わります

## 備考
ver 1.0  
VRCSDKのバージョン : VRCSDK-2018.04.25.09.19_Public
