{ lib
, aiohttp
, asynctest
, buildPythonPackage
, fetchFromGitHub
, pytestCheckHook
, zigpy
}:

buildPythonPackage rec {
  pname = "zha-quirks";
  version = "0.0.73";

  src = fetchFromGitHub {
    owner = "zigpy";
    repo = "zha-device-handlers";
    rev = "refs/tags/${version}";
    sha256 = "sha256-vC1kkh9t2fWmSqmKQz9ON8Y+tBFhTxrprLNzOldQR+A=";
  };

  propagatedBuildInputs = [
    aiohttp
    zigpy
  ];

  checkInputs = [
    asynctest
    pytestCheckHook
  ];

  pythonImportsCheck = [ "zhaquirks" ];

  meta = with lib; {
    description = "ZHA Device Handlers are custom quirks implementations for Zigpy";
    homepage = "https://github.com/dmulcahey/zha-device-handlers";
    license = licenses.asl20;
    maintainers = with maintainers; [ etu ];
    platforms = platforms.linux;
  };
}
