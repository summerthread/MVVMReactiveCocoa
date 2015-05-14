#!/bin/sh
set -e

mkdir -p "${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}"

RESOURCES_TO_COPY=${PODS_ROOT}/resources-to-copy-${TARGETNAME}.txt
> "$RESOURCES_TO_COPY"

XCASSET_FILES=""

install_resource()
{
  case $1 in
    *.storyboard)
      echo "ibtool --reference-external-strings-file --errors --warnings --notices --output-format human-readable-text --compile ${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename \"$1\" .storyboard`.storyboardc ${PODS_ROOT}/$1 --sdk ${SDKROOT}"
      ibtool --reference-external-strings-file --errors --warnings --notices --output-format human-readable-text --compile "${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename \"$1\" .storyboard`.storyboardc" "${PODS_ROOT}/$1" --sdk "${SDKROOT}"
      ;;
    *.xib)
        echo "ibtool --reference-external-strings-file --errors --warnings --notices --output-format human-readable-text --compile ${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename \"$1\" .xib`.nib ${PODS_ROOT}/$1 --sdk ${SDKROOT}"
      ibtool --reference-external-strings-file --errors --warnings --notices --output-format human-readable-text --compile "${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename \"$1\" .xib`.nib" "${PODS_ROOT}/$1" --sdk "${SDKROOT}"
      ;;
    *.framework)
      echo "mkdir -p ${CONFIGURATION_BUILD_DIR}/${FRAMEWORKS_FOLDER_PATH}"
      mkdir -p "${CONFIGURATION_BUILD_DIR}/${FRAMEWORKS_FOLDER_PATH}"
      echo "rsync -av ${PODS_ROOT}/$1 ${CONFIGURATION_BUILD_DIR}/${FRAMEWORKS_FOLDER_PATH}"
      rsync -av "${PODS_ROOT}/$1" "${CONFIGURATION_BUILD_DIR}/${FRAMEWORKS_FOLDER_PATH}"
      ;;
    *.xcdatamodel)
      echo "xcrun momc \"${PODS_ROOT}/$1\" \"${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename "$1"`.mom\""
      xcrun momc "${PODS_ROOT}/$1" "${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename "$1" .xcdatamodel`.mom"
      ;;
    *.xcdatamodeld)
      echo "xcrun momc \"${PODS_ROOT}/$1\" \"${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename "$1" .xcdatamodeld`.momd\""
      xcrun momc "${PODS_ROOT}/$1" "${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename "$1" .xcdatamodeld`.momd"
      ;;
    *.xcmappingmodel)
      echo "xcrun mapc \"${PODS_ROOT}/$1\" \"${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename "$1" .xcmappingmodel`.cdm\""
      xcrun mapc "${PODS_ROOT}/$1" "${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename "$1" .xcmappingmodel`.cdm"
      ;;
    *.xcassets)
      XCASSET_FILES="$XCASSET_FILES '${PODS_ROOT}/$1'"
      ;;
    /*)
      echo "$1"
      echo "$1" >> "$RESOURCES_TO_COPY"
      ;;
    *)
      echo "${PODS_ROOT}/$1"
      echo "${PODS_ROOT}/$1" >> "$RESOURCES_TO_COPY"
      ;;
  esac
}
if [[ "$CONFIGURATION" == "Debug" ]]; then
  install_resource "FormatterKit/Localizations/ca.lproj"
  install_resource "FormatterKit/Localizations/cs.lproj"
  install_resource "FormatterKit/Localizations/da.lproj"
  install_resource "FormatterKit/Localizations/de.lproj"
  install_resource "FormatterKit/Localizations/el.lproj"
  install_resource "FormatterKit/Localizations/en.lproj"
  install_resource "FormatterKit/Localizations/es.lproj"
  install_resource "FormatterKit/Localizations/fr.lproj"
  install_resource "FormatterKit/Localizations/id.lproj"
  install_resource "FormatterKit/Localizations/it.lproj"
  install_resource "FormatterKit/Localizations/ja.lproj"
  install_resource "FormatterKit/Localizations/ko.lproj"
  install_resource "FormatterKit/Localizations/nb.lproj"
  install_resource "FormatterKit/Localizations/nl.lproj"
  install_resource "FormatterKit/Localizations/nn.lproj"
  install_resource "FormatterKit/Localizations/pl.lproj"
  install_resource "FormatterKit/Localizations/pt.lproj"
  install_resource "FormatterKit/Localizations/pt_BR.lproj"
  install_resource "FormatterKit/Localizations/ru.lproj"
  install_resource "FormatterKit/Localizations/sv.lproj"
  install_resource "FormatterKit/Localizations/tr.lproj"
  install_resource "FormatterKit/Localizations/uk.lproj"
  install_resource "FormatterKit/Localizations/vi.lproj"
  install_resource "FormatterKit/Localizations/zh-Hans.lproj"
  install_resource "FormatterKit/Localizations/zh-Hant.lproj"
  install_resource "IQKeyboardManager/IQKeyBoardManager/Resources/IQKeyboardManager.bundle"
  install_resource "OcticonsIOS/OcticonsIOS/octicons.ttf"
  install_resource "UMengSocial/umeng_ios_social_sdk_4.2.2_arm64_custom/UMSocial_Sdk_4.2.2/UMSocialSDKResourcesNew.bundle"
  install_resource "UMengSocial/umeng_ios_social_sdk_4.2.2_arm64_custom/UMSocial_Sdk_Extra_Frameworks/TencentOpenAPI/TencentOpenApi_IOS_Bundle.bundle"
  install_resource "UMengSocial/umeng_ios_social_sdk_4.2.2_arm64_custom/UMSocial_Sdk_4.2.2/SocialSDKXib/UMSCommentDetailController.xib"
  install_resource "UMengSocial/umeng_ios_social_sdk_4.2.2_arm64_custom/UMSocial_Sdk_4.2.2/SocialSDKXib/UMSCommentInputController.xib"
  install_resource "UMengSocial/umeng_ios_social_sdk_4.2.2_arm64_custom/UMSocial_Sdk_4.2.2/SocialSDKXib/UMSCommentInputControlleriPad.xib"
  install_resource "UMengSocial/umeng_ios_social_sdk_4.2.2_arm64_custom/UMSocial_Sdk_4.2.2/SocialSDKXib/UMShareEditViewController.xib"
  install_resource "UMengSocial/umeng_ios_social_sdk_4.2.2_arm64_custom/UMSocial_Sdk_4.2.2/SocialSDKXib/UMShareEditViewControlleriPad.xib"
  install_resource "UMengSocial/umeng_ios_social_sdk_4.2.2_arm64_custom/UMSocial_Sdk_4.2.2/SocialSDKXib/UMSLoginViewController.xib"
  install_resource "UMengSocial/umeng_ios_social_sdk_4.2.2_arm64_custom/UMSocial_Sdk_4.2.2/SocialSDKXib/UMSnsAccountViewController.xib"
  install_resource "UMengSocial/umeng_ios_social_sdk_4.2.2_arm64_custom/UMSocial_Sdk_4.2.2/SocialSDKXib/UMSShareListController.xib"
  install_resource "UMengSocial/umeng_ios_social_sdk_4.2.2_arm64_custom/UMSocial_Sdk_4.2.2/en.lproj"
  install_resource "UMengSocial/umeng_ios_social_sdk_4.2.2_arm64_custom/UMSocial_Sdk_4.2.2/zh-Hans.lproj"
  install_resource "WebViewJavascriptBridge/WebViewJavascriptBridge/WebViewJavascriptBridge.js.txt"
fi
if [[ "$CONFIGURATION" == "Release" ]]; then
  install_resource "FormatterKit/Localizations/ca.lproj"
  install_resource "FormatterKit/Localizations/cs.lproj"
  install_resource "FormatterKit/Localizations/da.lproj"
  install_resource "FormatterKit/Localizations/de.lproj"
  install_resource "FormatterKit/Localizations/el.lproj"
  install_resource "FormatterKit/Localizations/en.lproj"
  install_resource "FormatterKit/Localizations/es.lproj"
  install_resource "FormatterKit/Localizations/fr.lproj"
  install_resource "FormatterKit/Localizations/id.lproj"
  install_resource "FormatterKit/Localizations/it.lproj"
  install_resource "FormatterKit/Localizations/ja.lproj"
  install_resource "FormatterKit/Localizations/ko.lproj"
  install_resource "FormatterKit/Localizations/nb.lproj"
  install_resource "FormatterKit/Localizations/nl.lproj"
  install_resource "FormatterKit/Localizations/nn.lproj"
  install_resource "FormatterKit/Localizations/pl.lproj"
  install_resource "FormatterKit/Localizations/pt.lproj"
  install_resource "FormatterKit/Localizations/pt_BR.lproj"
  install_resource "FormatterKit/Localizations/ru.lproj"
  install_resource "FormatterKit/Localizations/sv.lproj"
  install_resource "FormatterKit/Localizations/tr.lproj"
  install_resource "FormatterKit/Localizations/uk.lproj"
  install_resource "FormatterKit/Localizations/vi.lproj"
  install_resource "FormatterKit/Localizations/zh-Hans.lproj"
  install_resource "FormatterKit/Localizations/zh-Hant.lproj"
  install_resource "IQKeyboardManager/IQKeyBoardManager/Resources/IQKeyboardManager.bundle"
  install_resource "OcticonsIOS/OcticonsIOS/octicons.ttf"
  install_resource "UMengSocial/umeng_ios_social_sdk_4.2.2_arm64_custom/UMSocial_Sdk_4.2.2/UMSocialSDKResourcesNew.bundle"
  install_resource "UMengSocial/umeng_ios_social_sdk_4.2.2_arm64_custom/UMSocial_Sdk_Extra_Frameworks/TencentOpenAPI/TencentOpenApi_IOS_Bundle.bundle"
  install_resource "UMengSocial/umeng_ios_social_sdk_4.2.2_arm64_custom/UMSocial_Sdk_4.2.2/SocialSDKXib/UMSCommentDetailController.xib"
  install_resource "UMengSocial/umeng_ios_social_sdk_4.2.2_arm64_custom/UMSocial_Sdk_4.2.2/SocialSDKXib/UMSCommentInputController.xib"
  install_resource "UMengSocial/umeng_ios_social_sdk_4.2.2_arm64_custom/UMSocial_Sdk_4.2.2/SocialSDKXib/UMSCommentInputControlleriPad.xib"
  install_resource "UMengSocial/umeng_ios_social_sdk_4.2.2_arm64_custom/UMSocial_Sdk_4.2.2/SocialSDKXib/UMShareEditViewController.xib"
  install_resource "UMengSocial/umeng_ios_social_sdk_4.2.2_arm64_custom/UMSocial_Sdk_4.2.2/SocialSDKXib/UMShareEditViewControlleriPad.xib"
  install_resource "UMengSocial/umeng_ios_social_sdk_4.2.2_arm64_custom/UMSocial_Sdk_4.2.2/SocialSDKXib/UMSLoginViewController.xib"
  install_resource "UMengSocial/umeng_ios_social_sdk_4.2.2_arm64_custom/UMSocial_Sdk_4.2.2/SocialSDKXib/UMSnsAccountViewController.xib"
  install_resource "UMengSocial/umeng_ios_social_sdk_4.2.2_arm64_custom/UMSocial_Sdk_4.2.2/SocialSDKXib/UMSShareListController.xib"
  install_resource "UMengSocial/umeng_ios_social_sdk_4.2.2_arm64_custom/UMSocial_Sdk_4.2.2/en.lproj"
  install_resource "UMengSocial/umeng_ios_social_sdk_4.2.2_arm64_custom/UMSocial_Sdk_4.2.2/zh-Hans.lproj"
  install_resource "WebViewJavascriptBridge/WebViewJavascriptBridge/WebViewJavascriptBridge.js.txt"
fi

rsync -avr --copy-links --no-relative --exclude '*/.svn/*' --files-from="$RESOURCES_TO_COPY" / "${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}"
if [[ "${ACTION}" == "install" ]]; then
  rsync -avr --copy-links --no-relative --exclude '*/.svn/*' --files-from="$RESOURCES_TO_COPY" / "${INSTALL_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}"
fi
rm -f "$RESOURCES_TO_COPY"

if [[ -n "${WRAPPER_EXTENSION}" ]] && [ "`xcrun --find actool`" ] && [ -n "$XCASSET_FILES" ]
then
  case "${TARGETED_DEVICE_FAMILY}" in
    1,2)
      TARGET_DEVICE_ARGS="--target-device ipad --target-device iphone"
      ;;
    1)
      TARGET_DEVICE_ARGS="--target-device iphone"
      ;;
    2)
      TARGET_DEVICE_ARGS="--target-device ipad"
      ;;
    *)
      TARGET_DEVICE_ARGS="--target-device mac"
      ;;
  esac
  while read line; do XCASSET_FILES="$XCASSET_FILES '$line'"; done <<<$(find "$PWD" -name "*.xcassets" | egrep -v "^$PODS_ROOT")
  echo $XCASSET_FILES | xargs actool --output-format human-readable-text --notices --warnings --platform "${PLATFORM_NAME}" --minimum-deployment-target "${IPHONEOS_DEPLOYMENT_TARGET}" ${TARGET_DEVICE_ARGS} --compress-pngs --compile "${BUILT_PRODUCTS_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}"
fi
