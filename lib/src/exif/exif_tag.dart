import 'ifd_value.dart';

class ExifTag {
  final String name;
  final IfdValueType type;
  int? count;
  ExifTag(this.name, [this.type = IfdValueType.none, this.count]);
}

const exifTagNameToID = <String, int>{
  'ProcessingSoftware': 0xb,
  'SubfileType': 0xfe,
  'OldSubfileType': 0xff,
  'ImageWidth': 0x100,
  'ImageLength': 0x101,
  'ImageHeight': 0x101, // alias for a more common name.
  'BitsPerSample': 0x102,
  'Compression': 0x103,
  'PhotometricInterpretation': 0x106,
  'Thresholding': 0x107,
  'CellWidth': 0x108,
  'CellLength': 0x109,
  'FillOrder': 0x10a,
  'DocumentName': 0x10d,
  'ImageDescription': 0x10e,
  'Make': 0x10f,
  'Model': 0x110,
  'StripOffsets': 0x111,
  'Orientation': 0x112,
  'SamplesPerPixel': 0x115,
  'RowsPerStrip': 0x116,
  'StripByteCounts': 0x117,
  'MinSampleValue': 0x118,
  'MaxSampleValue': 0x119,
  'XResolution': 0x11a,
  'YResolution': 0x11b,
  'PlanarConfiguration': 0x11c,
  'PageName': 0x11d,
  'XPosition': 0x11e,
  'YPosition': 0x11f,
  'GrayResponseUnit': 0x122,
  'GrayResponseCurve': 0x123,
  'T4Options': 0x124,
  'T6Options': 0x125,
  'ResolutionUnit': 0x128,
  'PageNumber': 0x129,
  'ColorResponseUnit': 0x12c,
  'TransferFunction': 0x12d,
  'Software': 0x131,
  'DateTime': 0x132,
  'Artist': 0x13b,
  'HostComputer': 0x13c,
  'Predictor': 0x13d,
  'WhitePoint': 0x13e,
  'PrimaryChromaticities': 0x13f,
  'ColorMap': 0x140,
  'HalftoneHints': 0x141,
  'TileWidth': 0x142,
  'TileLength': 0x143,
  'TileOffsets': 0x144,
  'TileByteCounts': 0x145,
  'BadFaxLines': 0x146,
  'CleanFaxData': 0x147,
  'ConsecutiveBadFaxLines': 0x148,
  'InkSet': 0x14c,
  'InkNames': 0x14d,
  'NumberofInks': 0x14e,
  'DotRange': 0x150,
  'TargetPrinter': 0x151,
  'ExtraSamples': 0x152,
  'SampleFormat': 0x153,
  'SMinSampleValue': 0x154,
  'SMaxSampleValue': 0x155,
  'TransferRange': 0x156,
  'ClipPath': 0x157,
  'JPEGProc': 0x200,
  'JPEGInterchangeFormat': 0x201,
  'JPEGInterchangeFormatLength': 0x202,
  'YCbCrCoefficients': 0x211,
  'YCbCrSubSampling': 0x212,
  'YCbCrPositioning': 0x213,
  'ReferenceBlackWhite': 0x214,
  'ApplicationNotes': 0x2bc,
  'Rating': 0x4746,
  'CFARepeatPatternDim': 0x828d,
  'CFAPattern': 0x828e,
  'BatteryLevel': 0x828f,
  'Copyright': 0x8298,
  'ExposureTime': 0x829a,
  'FNumber': 0x829d,
  'IPTC-NAA': 0x83bb,
  'ExifOffset': 0x8769,
  'InterColorProfile': 0x8773,
  'ExposureProgram': 0x8822,
  'SpectralSensitivity': 0x8824,
  'GPSOffset': 0x8825,
  'ISOSpeed': 0x8827,
  'OECF': 0x8828,
  'SensitivityType': 0x8830,
  'RecommendedExposureIndex': 0x8832,
  'ExifVersion': 0x9000,
  'DateTimeOriginal': 0x9003,
  'DateTimeDigitized': 0x9004,
  'OffsetTime': 0x9010,
  'OffsetTimeOriginal': 0x9011,
  'OffsetTimeDigitized': 0x9012,
  'ComponentsConfiguration': 0x9101,
  'CompressedBitsPerPixel': 0x9102,
  'ShutterSpeedValue': 0x9201,
  'ApertureValue': 0x9202,
  'BrightnessValue': 0x9203,
  'ExposureBiasValue': 0x9204,
  'MaxApertureValue': 0x9205,
  'SubjectDistance': 0x9206,
  'MeteringMode': 0x9207,
  'LightSource': 0x9208,
  'Flash': 0x9209,
  'FocalLength': 0x920a,
  'SubjectArea': 0x9214,
  'MakerNote': 0x927c,
  'UserComment': 0x9286,
  'SubSecTime': 0x9290,
  'SubSecTimeOriginal': 0x9291,
  'SubSecTimeDigitized': 0x9292,
  'XPTitle': 0x9c9b,
  'XPComment': 0x9c9c,
  'XPAuthor': 0x9c9d,
  'XPKeywords': 0x9c9e,
  'XPSubject': 0x9c9f,
  'FlashPixVersion': 0xa000,
  'ColorSpace': 0xa001,
  'ExifImageWidth': 0xa002,
  'ExifImageLength': 0xa003,
  'RelatedSoundFile': 0xa004,
  'InteroperabilityOffset': 0xa005,
  'FlashEnergy': 0xa20b,
  'SpatialFrequencyResponse': 0xa20c,
  'FocalPlaneXResolution': 0xa20e,
  'FocalPlaneYResolution': 0xa20f,
  'FocalPlaneResolutionUnit': 0xa210,
  'SubjectLocation': 0xa214,
  'ExposureIndex': 0xa215,
  'SensingMethod': 0xa217,
  'FileSource': 0xa300,
  'SceneType': 0xa301,
  'CVAPattern': 0xa302,
  'CustomRendered': 0xa401,
  'ExposureMode': 0xa402,
  'WhiteBalance': 0xa403,
  'DigitalZoomRatio': 0xa404,
  'FocalLengthIn35mmFilm': 0xa405,
  'SceneCaptureType': 0xa406,
  'GainControl': 0xa407,
  'Contrast': 0xa408,
  'Saturation': 0xa409,
  'Sharpness': 0xa40a,
  'DeviceSettingDescription': 0xa40b,
  'SubjectDistanceRange': 0xa40c,
  'ImageUniqueID': 0xa420,
  'CameraOwnerName': 0xa430,
  'BodySerialNumber': 0xa431,
  'LensSpecification': 0xa432,
  'LensMake': 0xa433,
  'LensModel': 0xa434,
  'LensSerialNumber': 0xa435,
  'Gamma': 0xa500,
  'PrintIM': 0xc4a5,
  'Padding': 0xea1c,
  'OffsetSchema': 0xea1d,
  'OwnerName': 0xfde8,
  'SerialNumber': 0xfde9,
  'InteropIndex': 0x1,
  'InteropVersion': 0x2,
  'RelatedImageFileFormat': 0x1000,
  'RelatedImageWidth': 0x1001,
  'RelatedImageLength': 0x1002,
  'GPSVersionID': 0x0,
  'GPSLatitudeRef': 0x1,
  'GPSLatitude': 0x2,
  'GPSLongitudeRef': 0x3,
  'GPSLongitude': 0x4,
  'GPSAltitudeRef': 0x5,
  'GPSAltitude': 0x6,
  'GPSTimeStamp': 0x7,
  'GPSSatellites': 0x8,
  'GPSStatus': 0x9,
  'GPSMeasureMode': 0xa,
  'GPSDOP': 0xb,
  'GPSSpeedRef': 0xc,
  'GPSSpeed': 0xd,
  'GPSTrackRef': 0xe,
  'GPSTrack': 0xf,
  'GPSImgDirectionRef': 0x10,
  'GPSImgDirection': 0x11,
  'GPSMapDatum': 0x12,
  'GPSDestLatitudeRef': 0x13,
  'GPSDestLatitude': 0x14,
  'GPSDestLongitudeRef': 0x15,
  'GPSDestLongitude': 0x16,
  'GPSDestBearingRef': 0x17,
  'GPSDestBearing': 0x18,
  'GPSDestDistanceRef': 0x19,
  'GPSDestDistance': 0x1a,
  'GPSProcessingMethod': 0x1b,
  'GPSAreaInformation': 0x1c,
  'GPSDate': 0x1d,
  'GPSDifferential': 0x1e,
};

final exifImageTags = <int, ExifTag>{
  0x000B: ExifTag('ProcessingSoftware', IfdValueType.ascii),
  0x00FE: ExifTag('SubfileType', IfdValueType.long, 1),
  0x00FF: ExifTag('OldSubfileType', IfdValueType.long, 1),
  0x0100: ExifTag('ImageWidth', IfdValueType.long, 1),
  0x0101: ExifTag('ImageLength', IfdValueType.long, 1),
  0x0102: ExifTag('BitsPerSample', IfdValueType.short, 1),
  0x0103: ExifTag('Compression', IfdValueType.short, 1),
  0x0106: ExifTag('PhotometricInterpretation', IfdValueType.short, 1),
  0x0107: ExifTag('Thresholding', IfdValueType.short, 1),
  0x0108: ExifTag('CellWidth', IfdValueType.short, 1),
  0x0109: ExifTag('CellLength', IfdValueType.short, 1),
  0x010A: ExifTag('FillOrder', IfdValueType.short, 1),
  0x010D: ExifTag('DocumentName', IfdValueType.ascii),
  0x010E: ExifTag('ImageDescription', IfdValueType.ascii),
  0x010F: ExifTag('Make', IfdValueType.ascii),
  0x0110: ExifTag('Model', IfdValueType.ascii),
  0x0111: ExifTag('StripOffsets', IfdValueType.long),
  0x0112: ExifTag('Orientation', IfdValueType.short, 1),
  0x0115: ExifTag('SamplesPerPixel', IfdValueType.short, 1),
  0x0116: ExifTag('RowsPerStrip', IfdValueType.long, 1),
  0x0117: ExifTag('StripByteCounts', IfdValueType.long, 1),
  0x0118: ExifTag('MinSampleValue', IfdValueType.short, 1),
  0x0119: ExifTag('MaxSampleValue', IfdValueType.short, 1),
  0x011A: ExifTag('XResolution', IfdValueType.rational, 1),
  0x011B: ExifTag('YResolution', IfdValueType.rational, 1),
  0x011C: ExifTag('PlanarConfiguration', IfdValueType.short, 1),
  0x011D: ExifTag('PageName', IfdValueType.ascii),
  0x011E: ExifTag('XPosition', IfdValueType.rational, 1),
  0x011F: ExifTag('YPosition', IfdValueType.rational, 1),
  0x0122: ExifTag('GrayResponseUnit', IfdValueType.short, 1),
  0x0123: ExifTag('GrayResponseCurve'),
  0x0124: ExifTag('T4Options'),
  0x0125: ExifTag('T6Options'),
  0x0128: ExifTag('ResolutionUnit', IfdValueType.short, 1),
  0x0129: ExifTag('PageNumber', IfdValueType.short, 2),
  0x012C: ExifTag('ColorResponseUnit'),
  0x012D: ExifTag('TransferFunction', IfdValueType.short, 768),
  0x0131: ExifTag('Software', IfdValueType.ascii),
  0x0132: ExifTag('DateTime', IfdValueType.ascii),
  0x013B: ExifTag('Artist', IfdValueType.ascii),
  0x013C: ExifTag('HostComputer', IfdValueType.ascii),
  0x013D: ExifTag('Predictor', IfdValueType.short, 1),
  0x013E: ExifTag('WhitePoint', IfdValueType.rational, 2),
  0x013F: ExifTag('PrimaryChromaticities', IfdValueType.rational, 6),
  0x0140: ExifTag('ColorMap', IfdValueType.short),
  0x0141: ExifTag('HalftoneHints', IfdValueType.short, 2),
  0x0142: ExifTag('TileWidth', IfdValueType.long, 1),
  0x0143: ExifTag('TileLength', IfdValueType.long, 1),
  0x0144: ExifTag('TileOffsets', IfdValueType.long),
  0x0145: ExifTag('TileByteCounts'),
  0x0146: ExifTag('BadFaxLines'),
  0x0147: ExifTag('CleanFaxData'),
  0x0148: ExifTag('ConsecutiveBadFaxLines'),
  0x014C: ExifTag('InkSet'),
  0x014D: ExifTag('InkNames'),
  0x014E: ExifTag('NumberofInks'),
  0x0150: ExifTag('DotRange'),
  0x0151: ExifTag('TargetPrinter', IfdValueType.ascii),
  0x0152: ExifTag('ExtraSamples'),
  0x0153: ExifTag('SampleFormat', IfdValueType.short, 1),
  0x0154: ExifTag('SMinSampleValue'),
  0x0155: ExifTag('SMaxSampleValue'),
  0x0156: ExifTag('TransferRange'),
  0x0157: ExifTag('ClipPath'),
  0x0200: ExifTag('JPEGProc'),
  0x0201: ExifTag('JPEGInterchangeFormat'),
  0x0202: ExifTag('JPEGInterchangeFormatLength'),
  0x0211: ExifTag('YCbCrCoefficients', IfdValueType.rational, 3),
  0x0212: ExifTag('YCbCrSubSampling', IfdValueType.short, 1),
  0x0213: ExifTag('YCbCrPositioning', IfdValueType.short, 1),
  0x0214: ExifTag('ReferenceBlackWhite', IfdValueType.rational, 6),
  0x02BC: ExifTag('ApplicationNotes', IfdValueType.short, 1), // XPM Info
  0x4746: ExifTag('Rating', IfdValueType.short, 1),
  0x828D: ExifTag('CFARepeatPatternDim'),
  0x828E: ExifTag('CFAPattern'),
  0x828F: ExifTag('BatteryLevel'),
  0x8298: ExifTag('Copyright', IfdValueType.ascii),
  0x829A: ExifTag('ExposureTime', IfdValueType.rational, 1),
  0x829D: ExifTag('FNumber', IfdValueType.rational),
  0x83BB: ExifTag('IPTC-NAA', IfdValueType.long, 1),
  0x8769: ExifTag('ExifOffset'), // Exif Tags
  0x8773: ExifTag('InterColorProfile'),
  0x8822: ExifTag('ExposureProgram', IfdValueType.short, 1),
  0x8824: ExifTag('SpectralSensitivity', IfdValueType.ascii),
  0x8825: ExifTag('GPSOffset'), // GPS tags
  0x8827: ExifTag('ISOSpeed', IfdValueType.long, 1),
  0x8828: ExifTag('OECF'),
  0x8830: ExifTag('SensitivityType', IfdValueType.short, 1),
  0x8832: ExifTag('RecommendedExposureIndex', IfdValueType.long, 1),
  0x8833: ExifTag('ISOSpeed', IfdValueType.long, 1),
  0x9000: ExifTag('ExifVersion', IfdValueType.undefined),
  0x9003: ExifTag('DateTimeOriginal', IfdValueType.ascii),
  0x9004: ExifTag('DateTimeDigitized', IfdValueType.ascii),
  0x9010: ExifTag('OffsetTime', IfdValueType.ascii),
  0x9011: ExifTag('OffsetTimeOriginal', IfdValueType.ascii),
  0x9012: ExifTag('OffsetTimeDigitized', IfdValueType.ascii),
  0x9101: ExifTag('ComponentsConfiguration'),
  0x9102: ExifTag('CompressedBitsPerPixel'),
  0x9201: ExifTag('ShutterSpeedValue'),
  0x9202: ExifTag('ApertureValue'),
  0x9203: ExifTag('BrightnessValue'),
  0x9204: ExifTag('ExposureBiasValue'),
  0x9205: ExifTag('MaxApertureValue'),
  0x9206: ExifTag('SubjectDistance'),
  0x9207: ExifTag('MeteringMode'),
  0x9208: ExifTag('LightSource'),
  0x9209: ExifTag('Flash'),
  0x920A: ExifTag('FocalLength'),
  0x9214: ExifTag('SubjectArea'),
  0x927C: ExifTag('MakerNote'),
  0x9286: ExifTag('UserComment'),
  0x9290: ExifTag('SubSecTime'),
  0x9291: ExifTag('SubSecTimeOriginal'),
  0x9292: ExifTag('SubSecTimeDigitized'),
  0x9C9B: ExifTag('XPTitle'),
  0x9C9C: ExifTag('XPComment'),
  0x9C9D: ExifTag('XPAuthor'),
  0x9C9E: ExifTag('XPKeywords'),
  0x9C9F: ExifTag('XPSubject'),
  0xA000: ExifTag('FlashPixVersion'),
  0xA001: ExifTag('ColorSpace', IfdValueType.short, 1),
  0xA002: ExifTag('ExifImageWidth', IfdValueType.short, 1),
  0xA003: ExifTag('ExifImageLength', IfdValueType.short, 1),
  0xA004: ExifTag('RelatedSoundFile'),
  0xA005: ExifTag('InteroperabilityOffset'),
  0xA20B: ExifTag('FlashEnergy'), // 0x920B in TIFF/EP
  0xA20C: ExifTag('SpatialFrequencyResponse'),
  0xA20E: ExifTag('FocalPlaneXResolution'),
  0xA20F: ExifTag('FocalPlaneYResolution'),
  0xA210: ExifTag('FocalPlaneResolutionUnit'),
  0xA214: ExifTag('SubjectLocation'),
  0xA215: ExifTag('ExposureIndex'),
  0xA217: ExifTag('SensingMethod'),
  0xA300: ExifTag('FileSource'),
  0xA301: ExifTag('SceneType'),
  0xA302: ExifTag('CVAPattern'),
  0xA401: ExifTag('CustomRendered'),
  0xA402: ExifTag('ExposureMode'),
  0xA403: ExifTag('WhiteBalance'),
  0xA404: ExifTag('DigitalZoomRatio'),
  0xA405: ExifTag('FocalLengthIn35mmFilm'),
  0xA406: ExifTag('SceneCaptureType'),
  0xA407: ExifTag('GainControl'),
  0xA408: ExifTag('Contrast'),
  0xA409: ExifTag('Saturation'),
  0xA40A: ExifTag('Sharpness'),
  0xA40B: ExifTag('DeviceSettingDescription'),
  0xA40C: ExifTag('SubjectDistanceRange'),
  0xA420: ExifTag('ImageUniqueID'),
  0xA430: ExifTag('CameraOwnerName', IfdValueType.ascii),
  0xA431: ExifTag('BodySerialNumber', IfdValueType.ascii),
  0xA432: ExifTag('LensSpecification'),
  0xA433: ExifTag('LensMake', IfdValueType.ascii),
  0xA434: ExifTag('LensModel', IfdValueType.ascii),
  0xA435: ExifTag('LensSerialNumber', IfdValueType.ascii),
  0xA500: ExifTag('Gamma', IfdValueType.rational, 1),
  0xC4A5: ExifTag('PrintIM'),
  0xEA1C: ExifTag('Padding'),
  0xEA1D: ExifTag('OffsetSchema'),
  0xFDE8: ExifTag('OwnerName', IfdValueType.ascii),
  0xFDE9: ExifTag('SerialNumber', IfdValueType.ascii),
};

final exifInteropTags = <int, ExifTag>{
  0x0001: ExifTag('InteropIndex', IfdValueType.ascii),
  0x0002: ExifTag('InteropVersion', IfdValueType.undefined),
  0x1000: ExifTag('RelatedImageFileFormat', IfdValueType.ascii),
  0x1001: ExifTag('RelatedImageWidth', IfdValueType.short, 1),
  0x1002: ExifTag('RelatedImageLength', IfdValueType.short, 1),
};

final exifGpsTags = <int, ExifTag>{
  0x0000: ExifTag('GPSVersionID'),
  0x0001: ExifTag('GPSLatitudeRef'),
  0x0002: ExifTag('GPSLatitude'),
  0x0003: ExifTag('GPSLongitudeRef'),
  0x0004: ExifTag('GPSLongitude'),
  0x0005: ExifTag('GPSAltitudeRef'),
  0x0006: ExifTag('GPSAltitude'),
  0x0007: ExifTag('GPSTimeStamp'),
  0x0008: ExifTag('GPSSatellites'),
  0x0009: ExifTag('GPSStatus'),
  0x000A: ExifTag('GPSMeasureMode'),
  0x000B: ExifTag('GPSDOP'),
  0x000C: ExifTag('GPSSpeedRef'),
  0x000D: ExifTag('GPSSpeed'),
  0x000E: ExifTag('GPSTrackRef'),
  0x000F: ExifTag('GPSTrack'),
  0x0010: ExifTag('GPSImgDirectionRef'),
  0x0011: ExifTag('GPSImgDirection'),
  0x0012: ExifTag('GPSMapDatum'),
  0x0013: ExifTag('GPSDestLatitudeRef'),
  0x0014: ExifTag('GPSDestLatitude'),
  0x0015: ExifTag('GPSDestLongitudeRef'),
  0x0016: ExifTag('GPSDestLongitude'),
  0x0017: ExifTag('GPSDestBearingRef'),
  0x0018: ExifTag('GPSDestBearing'),
  0x0019: ExifTag('GPSDestDistanceRef'),
  0x001A: ExifTag('GPSDestDistance'),
  0x001B: ExifTag('GPSProcessingMethod'),
  0x001C: ExifTag('GPSAreaInformation'),
  0x001D: ExifTag('GPSDate'),
  0x001E: ExifTag('GPSDifferential'),
};
