function blkStruct = slblocks
% Blocksets_and_Toolboxes�E�B���h�E�ł̕\���ݒ�
blkStruct.Name = 'yoshimuLibrary';
blkStruct.OpenFcn = 'astroDynamics';
blkStruct.MaskInitialization = '';
blkStruct.MaskDisplay = '';
% ���C�u�����u���E�U�ł̕\���ݒ�
% ���ӁFBrowser�t�B�[���h��ݒ肷��Ƃ��́A�\���̔z��̃C���f�b�N�X�ԍ������
% �C���f�b�N�X�ԍ������w��̏ꍇ�Ƃ́A�ȉ��̂悤�ȋL�q�ł�
% Browser.Library = 'mylib';
Browser(1).Library = 'astroDynamics';
Browser(1).Name = 'yoshimuLibrary';
Browser(1).IsFlat = 0;
blkStruct.Browser = Browser;