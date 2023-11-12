// Made with Amplify Shader Editor v1.9.2.2
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "BOXOPHOBIC/The Vegetation Engine Lite/Geometry/Plant Standard Lit"
{
	Properties
	{
		[HideInInspector] _EmissionColor("Emission Color", Color) = (1,1,1,1)
		[HideInInspector] _AlphaCutoff("Alpha Cutoff ", Range(0, 1)) = 0.5
		[StyledCategory(Render Settings, 5, 10)]_CategoryRender("[ Category Render ]", Float) = 1
		[Enum(Opaque,0,Transparent,1)]_RenderMode("Render Mode", Float) = 0
		[Enum(Off,0,On,1)]_RenderZWrite("Render ZWrite", Float) = 1
		[Enum(Both,0,Back,1,Front,2)]_RenderCull("Render Faces", Float) = 0
		[Enum(Flip,0,Mirror,1,Same,2)]_RenderNormals("Render Normals", Float) = 0
		[HideInInspector]_RenderQueue("Render Queue", Float) = 0
		[HideInInspector]_RenderPriority("Render Priority", Float) = 0
		[Enum(Off,0,On,1)]_RenderSpecular("Render Specular", Float) = 1
		[Enum(Off,0,On,1)]_RenderDecals("Render Decals", Float) = 0
		[Enum(Off,0,On,1)]_RenderSSR("Render SSR", Float) = 0
		[Enum(Off,0,On,1)][Space(10)]_RenderClip("Alpha Clipping", Float) = 1
		_AlphaClipValue("Alpha Treshold", Range( 0 , 1)) = 0.5
		[StyledCategory(Global Settings)]_CategoryGlobals("[ Category Globals ]", Float) = 1
		_GlobalOverlay("Global Overlay", Range( 0 , 1)) = 1
		[Space(10)]_OverlayProjectionValue("Overlay Projection", Range( 0 , 1)) = 0.5
		[StyledCategory(Main Settings)]_CategoryMain("[Category Main ]", Float) = 1
		[StyledMessage(Info, Use the Main Mask remap sliders to control the mask for Main Colors__ Gradient Tinting and Subsurface Scattering when available. The mask is stored in Main Mask Blue channel. , 0, 10)]_MessageMainMask("# Message Main Mask", Float) = 0
		[NoScaleOffset][StyledTextureSingleLine]_MainAlbedoTex("Main Albedo", 2D) = "white" {}
		[NoScaleOffset][StyledTextureSingleLine]_MainNormalTex("Main Normal", 2D) = "bump" {}
		[NoScaleOffset][StyledTextureSingleLine]_MainMaskTex("Main Mask", 2D) = "white" {}
		[Space(10)][StyledVector(9)]_MainUVs("Main UVs", Vector) = (1,1,0,0)
		[Enum(Constant,0,Dual Color,1)]_MainColorMode("Main Color", Float) = 0
		[HDR]_MainColor("Main Color", Color) = (1,1,1,1)
		[HDR]_MainColorTwo("Main ColorB", Color) = (1,1,1,1)
		_MainAlbedoValue("Main Albedo", Range( 0 , 1)) = 1
		_MainNormalValue("Main Normal", Range( -8 , 8)) = 1
		_MainOcclusionValue("Main Occlusion", Range( 0 , 1)) = 0
		_MainSmoothnessValue("Main Smoothness", Range( 0 , 1)) = 0
		[StyledRemapSlider(_MainMaskMinValue, _MainMaskMaxValue, 0, 1, 0, 0)]_MainMaskRemap("Main Mask Remap", Vector) = (0,0,0,0)
		[HideInInspector]_MainMaskMinValue("Main Mask Min", Range( 0 , 1)) = 0
		[HideInInspector]_MainMaskMaxValue("Main Mask Max", Range( 0 , 1)) = 0
		[StyledCategory(Detail Settings)]_CategoryDetail("[ Category Detail ]", Float) = 1
		[StyledMessage(Info, Use the Detail Mask remap sliders to control the mask for Detail Colors__ Gradient Tinting and Subsurface Scattering when available. The mask is stored in Detail Mask Blue channel., 0, 10)]_MessageSecondMask("# Message Second Mask", Float) = 0
		[Enum(Off,0,On,1)]_DetailMode("Detail Mode", Float) = 0
		[Enum(Overlay,0,Replace,1)]_DetailBlendMode("Detail Blend", Float) = 1
		[Enum(Overlay,0,Replace,1)]_DetailAlphaMode("Detail Alpha", Float) = 1
		[NoScaleOffset][StyledTextureSingleLine]_SecondAlbedoTex("Detail Albedo", 2D) = "white" {}
		[NoScaleOffset][StyledTextureSingleLine]_SecondNormalTex("Detail Normal", 2D) = "bump" {}
		[NoScaleOffset][StyledTextureSingleLine]_SecondMaskTex("Detail Mask", 2D) = "white" {}
		[Enum(UV0,0,UV4,1,Planar UVs,2)][Space(10)]_SecondUVsMode("Detail UVs", Float) = 0
		[StyledVector(9)]_SecondUVs("Detail UVs", Vector) = (1,1,0,0)
		[StyledToggle]_SecondUVsScaleMode("Use Inverted Tilling Mode", Float) = 0
		[Enum(Constant,0,Dual Color,1)][Space(10)]_SecondColorMode("Detail Color", Float) = 0
		[HDR]_SecondColor("Detail Color", Color) = (1,1,1,1)
		[HDR]_SecondColorTwo("Detail ColorB", Color) = (1,1,1,1)
		_SecondAlbedoValue("Detail Albedo", Range( 0 , 1)) = 1
		_SecondNormalValue("Detail Normal", Range( -8 , 8)) = 1
		_SecondOcclusionValue("Detail Occlusion", Range( 0 , 1)) = 0
		_SecondSmoothnessValue("Detail Smoothness", Range( 0 , 1)) = 0
		[StyledRemapSlider(_SecondMaskMinValue, _SecondMaskMaxValue, 0, 1, 0, 0)]_SecondMaskRemap("Detail Mask Remap", Vector) = (0,0,0,0)
		[HideInInspector]_SecondMaskMinValue("Detail Mask Min", Range( 0 , 1)) = 0
		[HideInInspector]_SecondMaskMaxValue("Detail Mask Max", Range( 0 , 1)) = 0
		[Space(10)]_DetailValue("Detail Blend Intensity", Range( 0 , 1)) = 1
		_DetailNormalValue("Detail Blend Normals", Range( 0 , 1)) = 1
		[StyledRemapSlider(_DetailBlendMinValue, _DetailBlendMaxValue,0,1)]_DetailBlendRemap("Detail Blend Remap", Vector) = (0,0,0,0)
		[HideInInspector]_DetailBlendMinValue("Detail Blend Min", Range( 0 , 1)) = 0.4
		[HideInInspector]_DetailBlendMaxValue("Detail Blend Max", Range( 0 , 1)) = 0.6
		[Enum(Projection,0,Vertex Red,10,Vertex Green,20,Vertex Blue,30,Vertex Alpha,40)][Space(10)]_DetailMeshMode("Detail Surface Mask", Float) = 0
		[StyledRemapSlider(_DetailMeshMinValue, _DetailMeshMaxValue,0,1)]_DetailMeshRemap("Detail Surface Remap", Vector) = (0,0,0,0)
		[HideInInspector]_DetailMeshMinValue("Detail Surface Min", Range( 0 , 1)) = 0
		[HideInInspector]_DetailMeshMaxValue("Detail Surface Max", Range( 0 , 1)) = 1
		[Enum(Main Mask,0,Detail Mask,1)]_DetailMaskMode("Detail Texture Mask", Float) = 0
		[StyledRemapSlider(_DetailMaskMinValue, _DetailMaskMaxValue,0,1)]_DetailMaskRemap("Detail Texture Remap", Vector) = (0,0,0,0)
		[HideInInspector]_DetailMaskMinValue("Detail Texture Min", Range( 0 , 1)) = 0
		[HideInInspector]_DetailMaskMaxValue("Detail Texture Max", Range( 0 , 1)) = 1
		[StyledToggle]_DetailSnowMode("Use Detail as Snow Coverage", Float) = 0
		[HideInInspector]_second_uvs_mode("_second_uvs_mode", Vector) = (0,0,0,0)
		[HideInInspector]_detail_mesh_mode("_detail_mesh_mode", Vector) = (0,0,0,0)
		[StyledCategory(Occlusion Settings)]_CategoryOcclusion("[ Category Occlusion ]", Float) = 1
		[StyledMessage(Info, Use the Occlusion Color for tinting and the Occlusion Alpha as Global Overlay mask control when available., 0, 10)]_MessageOcclusion("# Message Occlusion", Float) = 0
		[Enum(Procedural,0,Vertex Red,10,Vertex Green,20,Vertex Blue,30,Vertex Alpha,40)]_VertexOcclusionMaskMode("Occlusion Mask", Float) = 40
		[HDR]_VertexOcclusionColor("Occlusion Color", Color) = (1,1,1,0.5019608)
		[StyledRemapSlider(_VertexOcclusionMinValue, _VertexOcclusionMaxValue, 0, 1, 0, 0)]_VertexOcclusionRemap("Occlusion Remap", Vector) = (0,0,0,0)
		[HideInInspector]_VertexOcclusionMinValue("Occlusion Min", Range( 0 , 1)) = 0
		[HideInInspector]_VertexOcclusionMaxValue("Occlusion Max", Range( 0 , 1)) = 1
		[Space(10)][StyledToggle]_VertexOcclusionOverlayMode("Use Inverted Mask for Overlay", Float) = 0
		[HideInInspector]_vertex_occlusion_mask_mode("_vertex_occlusion_mask_mode", Vector) = (0,0,0,0)
		[StyledCategory(Gradient Settings)]_CategoryGradient("[ Category Gradient ]", Float) = 1
		[HDR]_GradientColorOne("Gradient ColorA", Color) = (1,1,1,1)
		[HDR]_GradientColorTwo("Gradient ColorB", Color) = (1,1,1,1)
		[StyledRemapSlider(_GradientMinValue, _GradientMaxValue, 0, 1)]_GradientMaskRemap("Gradient Remap", Vector) = (0,0,0,0)
		[HideInInspector]_GradientMinValue("Gradient Min", Range( 0 , 1)) = 0
		[HideInInspector]_GradientMaxValue("Gradient Max ", Range( 0 , 1)) = 1
		[StyledCategory(Subsurface Settings)]_CategorySubsurface("[ Category Subsurface ]", Float) = 1
		[StyledMessage(Info, In HDRP__ the Subsurface Color and Power are fake effects used for artistic control. For physically correct subsurface scattering the Power slider need to be set to 0., 0, 10)]_MessageSubsurface("# Message Subsurface", Float) = 0
		[DiffusionProfile]_SubsurfaceDiffusion("Subsurface Diffusion", Float) = 0
		[HideInInspector]_SubsurfaceDiffusion_Asset("Subsurface Diffusion", Vector) = (0,0,0,0)
		[StyledSpace(10)]_SpaceSubsurface("# SpaceSubsurface", Float) = 0
		_SubsurfaceValue("Subsurface Intensity", Range( 0 , 1)) = 0
		[HDR]_SubsurfaceColor("Subsurface Color", Color) = (1,1,1,1)
		_SubsurfaceScatteringValue("Subsurface Power", Range( 0 , 16)) = 2
		_SubsurfaceAngleValue("Subsurface Angle", Range( 1 , 16)) = 8
		_SubsurfaceDirectValue("Subsurface Direct", Range( 0 , 1)) = 1
		_SubsurfaceNormalValue("Subsurface Normal", Range( 0 , 1)) = 0
		_SubsurfaceAmbientValue("Subsurface Ambient", Range( 0 , 1)) = 0.2
		_SubsurfaceShadowValue("Subsurface Shadow", Range( 0 , 1)) = 1
		_SubsurfaceMaskValue("Subsurface Use Mask", Range( 0 , 1)) = 1
		[StyledCategory(Emissive Settings)]_CategoryEmissive("[ Category Emissive]", Float) = 1
		[Enum(Off,0,On,1)]_EmissiveMode("Emissive Mode", Float) = 0
		[Enum(None,0,Any,1,Baked,2,Realtime,3)]_EmissiveFlagMode("Emissive GI", Float) = 0
		[NoScaleOffset][StyledTextureSingleLine]_EmissiveTex("Emissive Texture", 2D) = "white" {}
		[Space(10)][StyledVector(9)]_EmissiveUVs("Emissive UVs", Vector) = (1,1,0,0)
		[HDR]_EmissiveColor("Emissive Color", Color) = (0,0,0,0)
		[Enum(Nits,0,EV100,1)]_EmissiveIntensityMode("Emissive Power", Float) = 0
		_EmissiveIntensityValue("Emissive Power", Float) = 1
		[StyledRemapSlider(_EmissiveTexMinValue, _EmissiveTexMaxValue,0,1)]_EmissiveTexRemap("Emissive Remap", Vector) = (0,0,0,0)
		[HideInInspector]_EmissiveTexMinValue("Emissive Min", Range( 0 , 1)) = 0
		[HideInInspector]_EmissiveTexMaxValue("Emissive Max", Range( 0 , 1)) = 1
		[HideInInspector]_emissive_intensity_value("_emissive_intensity_value", Float) = 1
		[StyledCategory(Motion Settings)]_CategoryMotion("[ Category Motion ]", Float) = 1
		[Enum(Off,0,Vertex Red,10,Vertex Green,20,Vertex Blue,30,Vertex Alpha,40)]_MotionVariationMode("Motion Variation Mask", Float) = 10
		[Enum(Procedural,0,Vertex Red,10,Vertex Green,20,Vertex Blue,30,Vertex Alpha,40)]_MotionMaskMode_20("Motion Branch Mask", Float) = 20
		[Enum(Procedural,0,Vertex Red,10,Vertex Green,20,Vertex Blue,30,Vertex Alpha,40)]_MotionMaskMode_30("Motion Flutter Mask", Float) = 30
		[Space(10)]_MotionFacingValue("Motion Direction Mask", Range( 0 , 1)) = 0.5
		[Space(10)]_MotionAmplitude_10("Motion Bending", Range( 0 , 2)) = 0.2
		_MotionPosition_10("Motion Rigidity", Range( 0 , 1)) = 0.5
		[IntRange]_MotionSpeed_10("Motion Speed", Range( 0 , 40)) = 2
		_MotionScale_10("Motion Scale", Range( 0 , 40)) = 0
		_MotionVariation_10("Motion Variation", Range( 0 , 40)) = 0
		[Space(10)]_MotionAmplitude_20("Motion Squash", Range( 0 , 2)) = 0.2
		_MotionAmplitude_22("Motion Rolling", Range( 0 , 2)) = 0.2
		[IntRange]_MotionSpeed_20("Motion Speed", Range( 0 , 40)) = 6
		_MotionScale_20("Motion Scale", Range( 0 , 20)) = 3
		_MotionVariation_20("Motion Variation", Range( 0 , 20)) = 0
		[Space(10)]_MotionAmplitude_32("Motion Flutter", Range( 0 , 2)) = 0.2
		[IntRange]_MotionSpeed_32("Motion Speed", Range( 0 , 40)) = 6
		_MotionScale_32("Motion Scale", Range( 0 , 40)) = 10
		_MotionVariation_32("Motion Variation", Range( 0 , 40)) = 0
		[HideInInspector]_motion_variation_mode("_motion_variation_mode", Vector) = (0,0,0,0)
		[HideInInspector]_motion_mask_mode_20("_motion_mask_mode_20", Vector) = (0,0,0,0)
		[HideInInspector]_motion_mask_mode_30("_motion_mask_mode_30", Vector) = (0,0,0,0)
		[StyledCategory(Object Settings)]_CategoryObject("[ Category Object ]", Float) = 1
		[StyledMessage(Info, Use the Object Height for Gradient and Motion Bending remapping and the Object Radius for Procedural Occlusion and Procedural Motion remapping. The values must match when using meshes with multi materials., 0, 10)]_MessageBounds("# Message Bounds", Float) = 0
		_BoundsHeightValue("Object Height", Float) = 1
		_BoundsRadiusValue("Object Radius", Float) = 1
		[HideInInspector]_render_normals("_render_normals", Vector) = (1,1,1,0)
		[HideInInspector]_Cutoff("Legacy Cutoff", Float) = 0.5
		[HideInInspector]_Color("Legacy Color", Color) = (0,0,0,0)
		[HideInInspector]_MainTex("Legacy MainTex", 2D) = "white" {}
		[HideInInspector]_BumpMap("Legacy BumpMap", 2D) = "white" {}
		[HideInInspector]_MotionValue_20("_MotionValue_20", Float) = 1
		[HideInInspector]_MotionValue_30("_MotionValue_30", Float) = 1
		[HideInInspector]_IsLiteShader("_IsLiteShader", Float) = 1
		[HideInInspector]_IsTVEShader("_IsTVEShader", Float) = 1
		[HideInInspector]_IsIdentifier("_IsIdentifier", Float) = 0
		[HideInInspector]_IsCollected("_IsCollected", Float) = 0
		[HideInInspector]_IsCustomShader("_IsCustomShader", Float) = 0
		[HideInInspector]_IsShared("_IsShared", Float) = 0
		[HideInInspector]_HasEmissive("_HasEmissive", Float) = 0
		[HideInInspector]_HasGradient("_HasGradient", Float) = 0
		[HideInInspector]_HasOcclusion("_HasOcclusion", Float) = 0
		[HideInInspector]_VertexVariationMode("_VertexVariationMode", Float) = 0
		[HideInInspector]_IsVersion("_IsVersion", Float) = 1210
		[HideInInspector]_render_cull("_render_cull", Float) = 0
		[HideInInspector]_render_src("_render_src", Float) = 1
		[HideInInspector]_render_dst("_render_dst", Float) = 0
		[HideInInspector]_render_zw("_render_zw", Float) = 1
		[HideInInspector]_render_coverage("_render_coverage", Float) = 0
		[HideInInspector]_IsStandardShader("_IsStandardShader", Float) = 1
		[HideInInspector]_IsPlantShader("_IsPlantShader", Float) = 1


		//_TransmissionShadow( "Transmission Shadow", Range( 0, 1 ) ) = 0.5
		//_TransStrength( "Trans Strength", Range( 0, 50 ) ) = 1
		//_TransNormal( "Trans Normal Distortion", Range( 0, 1 ) ) = 0.5
		//_TransScattering( "Trans Scattering", Range( 1, 50 ) ) = 2
		//_TransDirect( "Trans Direct", Range( 0, 1 ) ) = 0.9
		//_TransAmbient( "Trans Ambient", Range( 0, 1 ) ) = 0.1
		//_TransShadow( "Trans Shadow", Range( 0, 1 ) ) = 0.5
		//_TessPhongStrength( "Tess Phong Strength", Range( 0, 1 ) ) = 0.5
		//_TessValue( "Tess Max Tessellation", Range( 1, 32 ) ) = 16
		//_TessMin( "Tess Min Distance", Float ) = 10
		//_TessMax( "Tess Max Distance", Float ) = 25
		//_TessEdgeLength ( "Tess Edge length", Range( 2, 50 ) ) = 16
		//_TessMaxDisp( "Tess Max Displacement", Float ) = 25

		[HideInInspector][ToggleOff] _SpecularHighlights("Specular Highlights", Float) = 1.0
		[HideInInspector][ToggleOff] _EnvironmentReflections("Environment Reflections", Float) = 1.0
		[HideInInspector][ToggleOff] _ReceiveShadows("Receive Shadows", Float) = 1.0

		[HideInInspector] _QueueOffset("_QueueOffset", Float) = 0
        [HideInInspector] _QueueControl("_QueueControl", Float) = -1

        [HideInInspector][NoScaleOffset] unity_Lightmaps("unity_Lightmaps", 2DArray) = "" {}
        [HideInInspector][NoScaleOffset] unity_LightmapsInd("unity_LightmapsInd", 2DArray) = "" {}
        [HideInInspector][NoScaleOffset] unity_ShadowMasks("unity_ShadowMasks", 2DArray) = "" {}
	}

	SubShader
	{
		LOD 0

		

		Tags { "RenderPipeline"="UniversalPipeline" "RenderType"="Opaque" "Queue"="Geometry" "UniversalMaterialType"="Lit" }

		Cull [_render_cull]
		ZWrite [_render_zw]
		ZTest LEqual
		Offset 0,0
		AlphaToMask Off

		

		HLSLINCLUDE
		#pragma target 4.5
		#pragma prefer_hlslcc gles
		// ensure rendering platforms toggle list is visible

		#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
		#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Filtering.hlsl"

		#ifndef ASE_TESS_FUNCS
		#define ASE_TESS_FUNCS
		float4 FixedTess( float tessValue )
		{
			return tessValue;
		}

		float CalcDistanceTessFactor (float4 vertex, float minDist, float maxDist, float tess, float4x4 o2w, float3 cameraPos )
		{
			float3 wpos = mul(o2w,vertex).xyz;
			float dist = distance (wpos, cameraPos);
			float f = clamp(1.0 - (dist - minDist) / (maxDist - minDist), 0.01, 1.0) * tess;
			return f;
		}

		float4 CalcTriEdgeTessFactors (float3 triVertexFactors)
		{
			float4 tess;
			tess.x = 0.5 * (triVertexFactors.y + triVertexFactors.z);
			tess.y = 0.5 * (triVertexFactors.x + triVertexFactors.z);
			tess.z = 0.5 * (triVertexFactors.x + triVertexFactors.y);
			tess.w = (triVertexFactors.x + triVertexFactors.y + triVertexFactors.z) / 3.0f;
			return tess;
		}

		float CalcEdgeTessFactor (float3 wpos0, float3 wpos1, float edgeLen, float3 cameraPos, float4 scParams )
		{
			float dist = distance (0.5 * (wpos0+wpos1), cameraPos);
			float len = distance(wpos0, wpos1);
			float f = max(len * scParams.y / (edgeLen * dist), 1.0);
			return f;
		}

		float DistanceFromPlane (float3 pos, float4 plane)
		{
			float d = dot (float4(pos,1.0f), plane);
			return d;
		}

		bool WorldViewFrustumCull (float3 wpos0, float3 wpos1, float3 wpos2, float cullEps, float4 planes[6] )
		{
			float4 planeTest;
			planeTest.x = (( DistanceFromPlane(wpos0, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos1, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos2, planes[0]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.y = (( DistanceFromPlane(wpos0, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos1, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos2, planes[1]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.z = (( DistanceFromPlane(wpos0, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos1, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos2, planes[2]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.w = (( DistanceFromPlane(wpos0, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos1, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos2, planes[3]) > -cullEps) ? 1.0f : 0.0f );
			return !all (planeTest);
		}

		float4 DistanceBasedTess( float4 v0, float4 v1, float4 v2, float tess, float minDist, float maxDist, float4x4 o2w, float3 cameraPos )
		{
			float3 f;
			f.x = CalcDistanceTessFactor (v0,minDist,maxDist,tess,o2w,cameraPos);
			f.y = CalcDistanceTessFactor (v1,minDist,maxDist,tess,o2w,cameraPos);
			f.z = CalcDistanceTessFactor (v2,minDist,maxDist,tess,o2w,cameraPos);

			return CalcTriEdgeTessFactors (f);
		}

		float4 EdgeLengthBasedTess( float4 v0, float4 v1, float4 v2, float edgeLength, float4x4 o2w, float3 cameraPos, float4 scParams )
		{
			float3 pos0 = mul(o2w,v0).xyz;
			float3 pos1 = mul(o2w,v1).xyz;
			float3 pos2 = mul(o2w,v2).xyz;
			float4 tess;
			tess.x = CalcEdgeTessFactor (pos1, pos2, edgeLength, cameraPos, scParams);
			tess.y = CalcEdgeTessFactor (pos2, pos0, edgeLength, cameraPos, scParams);
			tess.z = CalcEdgeTessFactor (pos0, pos1, edgeLength, cameraPos, scParams);
			tess.w = (tess.x + tess.y + tess.z) / 3.0f;
			return tess;
		}

		float4 EdgeLengthBasedTessCull( float4 v0, float4 v1, float4 v2, float edgeLength, float maxDisplacement, float4x4 o2w, float3 cameraPos, float4 scParams, float4 planes[6] )
		{
			float3 pos0 = mul(o2w,v0).xyz;
			float3 pos1 = mul(o2w,v1).xyz;
			float3 pos2 = mul(o2w,v2).xyz;
			float4 tess;

			if (WorldViewFrustumCull(pos0, pos1, pos2, maxDisplacement, planes))
			{
				tess = 0.0f;
			}
			else
			{
				tess.x = CalcEdgeTessFactor (pos1, pos2, edgeLength, cameraPos, scParams);
				tess.y = CalcEdgeTessFactor (pos2, pos0, edgeLength, cameraPos, scParams);
				tess.z = CalcEdgeTessFactor (pos0, pos1, edgeLength, cameraPos, scParams);
				tess.w = (tess.x + tess.y + tess.z) / 3.0f;
			}
			return tess;
		}
		#endif //ASE_TESS_FUNCS
		ENDHLSL

		
		Pass
		{
			
			Name "Forward"
			Tags { "LightMode"="UniversalForward" }

			Blend [_render_src] [_render_dst], One Zero
			ZWrite On
			ZTest LEqual
			Offset 0 , 0
			ColorMask RGBA

			

			HLSLPROGRAM

			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define _SPECULAR_SETUP 1
			#pragma multi_compile _ DOTS_INSTANCING_ON
			#define ASE_ABSOLUTE_VERTEX_POS 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140007
			#define ASE_USING_SAMPLING_MACROS 1


			//#pragma shader_feature_local _RECEIVE_SHADOWS_OFF
			//#pragma shader_feature_local_fragment _SPECULARHIGHLIGHTS_OFF
			//#pragma shader_feature_local_fragment _ENVIRONMENTREFLECTIONS_OFF

			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS _MAIN_LIGHT_SHADOWS_CASCADE _MAIN_LIGHT_SHADOWS_SCREEN
			#pragma multi_compile _ _ADDITIONAL_LIGHTS_VERTEX _ADDITIONAL_LIGHTS
			#pragma multi_compile_fragment _ _ADDITIONAL_LIGHT_SHADOWS
			#pragma multi_compile_fragment _ _REFLECTION_PROBE_BLENDING
			#pragma multi_compile_fragment _ _REFLECTION_PROBE_BOX_PROJECTION
			#pragma multi_compile_fragment _ _SHADOWS_SOFT _SHADOWS_SOFT_LOW _SHADOWS_SOFT_MEDIUM _SHADOWS_SOFT_HIGH
			#pragma multi_compile_fragment _ _SCREEN_SPACE_OCCLUSION
			#pragma multi_compile_fragment _ _DBUFFER_MRT1 _DBUFFER_MRT2 _DBUFFER_MRT3
			#pragma multi_compile_fragment _ _LIGHT_LAYERS
			#pragma multi_compile_fragment _ _LIGHT_COOKIES
			#pragma multi_compile _ _FORWARD_PLUS

			#pragma multi_compile _ LIGHTMAP_SHADOW_MIXING
			#pragma multi_compile _ SHADOWS_SHADOWMASK
			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
			#pragma multi_compile _ LIGHTMAP_ON
			#pragma multi_compile _ DYNAMICLIGHTMAP_ON
			#pragma multi_compile_fragment _ DEBUG_DISPLAY
			#pragma multi_compile_fragment _ _WRITE_RENDERING_LAYERS

			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS SHADERPASS_FORWARD

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Shadows.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DBuffer.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#if defined(LOD_FADE_CROSSFADE)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
            #endif

			#if defined(UNITY_INSTANCING_ENABLED) && defined(_TERRAIN_INSTANCED_PERPIXEL_NORMAL)
				#define ENABLE_TERRAIN_PERPIXEL_NORMAL
			#endif

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_BITANGENT
			#define ASE_NEEDS_FRAG_COLOR
			#define ASE_NEEDS_FRAG_POSITION
			#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR
			#pragma shader_feature_local_fragment TVE_FEATURE_CLIP
			#pragma shader_feature_local TVE_FEATURE_DETAIL
			#pragma shader_feature_local_fragment TVE_FEATURE_EMISSIVE
			#define TVE_IS_PLANT_SHADER
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END
			#define TVE_IS_STANDARD_SHADER
			#define THE_VEGETATION_ENGINE
			#define TVE_IS_UNIVERSAL_PIPELINE


			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE) && (SHADER_TARGET >= 45)
				#define ASE_SV_DEPTH SV_DepthLessEqual
				#define ASE_SV_POSITION_QUALIFIERS linear noperspective centroid
			#else
				#define ASE_SV_DEPTH SV_Depth
				#define ASE_SV_POSITION_QUALIFIERS
			#endif

			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 texcoord : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_color : COLOR;
				float4 ase_texcoord3 : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				ASE_SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
				float4 clipPosV : TEXCOORD0;
				float4 lightmapUVOrVertexSH : TEXCOORD1;
				half4 fogFactorAndVertexLight : TEXCOORD2;
				float4 tSpace0 : TEXCOORD3;
				float4 tSpace1 : TEXCOORD4;
				float4 tSpace2 : TEXCOORD5;
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					float4 shadowCoord : TEXCOORD6;
				#endif
				#if defined(DYNAMICLIGHTMAP_ON)
					float2 dynamicLightmapUV : TEXCOORD7;
				#endif
				float4 ase_texcoord8 : TEXCOORD8;
				float4 ase_color : COLOR;
				float4 ase_texcoord9 : TEXCOORD9;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _EmissiveTexRemap;
			half4 _GradientColorOne;
			half4 _GradientColorTwo;
			half4 _VertexOcclusionRemap;
			half4 _DetailBlendRemap;
			half4 _VertexOcclusionColor;
			half4 _vertex_occlusion_mask_mode;
			half4 _SecondUVs;
			float4 _GradientMaskRemap;
			half4 _second_uvs_mode;
			half4 _SecondColorTwo;
			half4 _SecondColor;
			half4 _MainColor;
			half4 _MainColorTwo;
			half4 _motion_mask_mode_20;
			half4 _DetailMeshRemap;
			half4 _SubsurfaceColor;
			float4 _SubsurfaceDiffusion_Asset;
			half4 _detail_mesh_mode;
			half4 _SecondMaskRemap;
			half4 _MainMaskRemap;
			float4 _Color;
			half4 _MainUVs;
			half4 _motion_variation_mode;
			half4 _DetailMaskRemap;
			half4 _motion_mask_mode_30;
			half4 _EmissiveUVs;
			half4 _EmissiveColor;
			half3 _render_normals;
			half _DetailBlendMode;
			half _SecondMaskMinValue;
			half _DetailMaskMode;
			half _SecondColorMode;
			half _SecondMaskMaxValue;
			half _render_cull;
			half _SecondUVsScaleMode;
			half _MainColorMode;
			half _MainMaskMaxValue;
			half _MainMaskMinValue;
			half _MainAlbedoValue;
			half _MotionMaskMode_30;
			half _MotionAmplitude_32;
			float _MotionSpeed_32;
			float _MotionVariation_32;
			float _MotionScale_32;
			half _MotionAmplitude_22;
			half _MotionMaskMode_20;
			half _SecondAlbedoValue;
			half _DetailMaskMinValue;
			half _DetailBlendMinValue;
			half _MainNormalValue;
			half _SecondOcclusionValue;
			half _MainOcclusionValue;
			half _SecondSmoothnessValue;
			half _MainSmoothnessValue;
			half _RenderSpecular;
			float _emissive_intensity_value;
			half _EmissiveTexMaxValue;
			half _EmissiveTexMinValue;
			half _SubsurfaceMaskValue;
			half _SubsurfaceValue;
			half _VertexOcclusionOverlayMode;
			half _OverlayProjectionValue;
			half _SecondNormalValue;
			half _SecondUVsMode;
			half _DetailNormalValue;
			half _GlobalOverlay;
			half _VertexOcclusionMaxValue;
			half _VertexOcclusionMinValue;
			half _VertexOcclusionMaskMode;
			half _GradientMaxValue;
			half _GradientMinValue;
			half _DetailValue;
			half _DetailMode;
			half _DetailBlendMaxValue;
			half _DetailMeshMaxValue;
			half _DetailMeshMinValue;
			half _DetailMeshMode;
			half _DetailMaskMaxValue;
			half _BoundsRadiusValue;
			half _MotionAmplitude_10;
			half _MotionFacingValue;
			half _SubsurfaceDirectValue;
			half _SubsurfaceAmbientValue;
			half _SubsurfaceShadowValue;
			half _IsVersion;
			half _MessageBounds;
			half _SpaceSubsurface;
			half _VertexVariationMode;
			half _HasEmissive;
			half _HasGradient;
			half _IsCustomShader;
			half _IsShared;
			half _IsCollected;
			half _IsIdentifier;
			half _HasOcclusion;
			half _IsTVEShader;
			half _RenderNormals;
			half _RenderMode;
			half _render_src;
			half _render_dst;
			half _render_zw;
			half _render_coverage;
			float _IsPlantShader;
			float _SubsurfaceDiffusion;
			half _SubsurfaceAngleValue;
			half _Cutoff;
			half _RenderSSR;
			half _RenderZWrite;
			half _RenderClip;
			half _RenderCull;
			half _RenderQueue;
			half _RenderPriority;
			half _RenderDecals;
			half _SubsurfaceNormalValue;
			half _SubsurfaceScatteringValue;
			half _MotionValue_30;
			half _EmissiveMode;
			half _IsLiteShader;
			half _DetailSnowMode;
			half _IsStandardShader;
			half _MotionPosition_10;
			float _MotionScale_10;
			half _EmissiveIntensityMode;
			float _MotionSpeed_10;
			half _MotionVariationMode;
			half _BoundsHeightValue;
			half _DetailAlphaMode;
			half _MotionScale_20;
			half _MotionVariation_20;
			half _MotionSpeed_20;
			half _MotionVariation_10;
			half _MotionAmplitude_20;
			half _EmissiveFlagMode;
			half _MessageOcclusion;
			half _MotionValue_20;
			half _MessageMainMask;
			half _MessageSecondMask;
			half _CategoryDetail;
			half _CategorySubsurface;
			half _CategoryEmissive;
			half _EmissiveIntensityValue;
			half _CategoryMotion;
			half _CategoryOcclusion;
			half _CategoryGradient;
			half _CategoryRender;
			half _CategoryMain;
			half _CategoryGlobals;
			half _MessageSubsurface;
			half _CategoryObject;
			half _AlphaClipValue;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);
			TEXTURE2D(_BumpMap);
			SAMPLER(sampler_BumpMap);
			TEXTURE2D(TVE_NoiseTex);
			half TVE_NoiseTexTilling;
			half4 TVE_MotionParams;
			half4 TVE_TimeParams;
			SAMPLER(sampler_Linear_Repeat);
			half4 TVE_WindEditor;
			half TVE_MotionValue_10;
			half TVE_MotionValue_20;
			half TVE_MotionValue_30;
			TEXTURE2D(_MainAlbedoTex);
			SAMPLER(sampler_MainAlbedoTex);
			TEXTURE2D(_MainMaskTex);
			TEXTURE2D(_SecondAlbedoTex);
			SAMPLER(sampler_SecondAlbedoTex);
			TEXTURE2D(_SecondMaskTex);
			TEXTURE2D(_MainNormalTex);
			half4 TVE_OverlayColor;
			half TVE_OverlayValue;
			TEXTURE2D(_SecondNormalTex);
			half TVE_SubsurfaceValue;
			half TVE_OverlaySubsurface;
			half3 TVE_MainLightDirection;
			half TVE_OverlayNormalValue;
			TEXTURE2D(_EmissiveTex);
			half TVE_OverlaySmoothness;


			
			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float3 VertexPosition3588_g80308 = v.positionOS.xyz;
				half3 Mesh_PivotsOS7730_g80308 = half3(0,0,0);
				float3 temp_output_7738_0_g80308 = ( VertexPosition3588_g80308 - Mesh_PivotsOS7730_g80308 );
				half3 VertexPos40_g80332 = temp_output_7738_0_g80308;
				half3 VertexPos40_g80333 = VertexPos40_g80332;
				float3 appendResult74_g80333 = (float3(VertexPos40_g80333.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g80333 = appendResult74_g80333;
				float3 break84_g80333 = VertexPos40_g80333;
				float3 appendResult81_g80333 = (float3(0.0 , break84_g80333.y , break84_g80333.z));
				half3 VertexPosOtherAxis82_g80333 = appendResult81_g80333;
				float3 ase_worldPos = TransformObjectToWorld( (v.positionOS).xyz );
				float3 vertexToFrag3890_g80308 = ase_worldPos;
				float3 WorldPosition3905_g80308 = vertexToFrag3890_g80308;
				float4x4 break19_g80338 = GetObjectToWorldMatrix();
				float3 appendResult20_g80338 = (float3(break19_g80338[ 0 ][ 3 ] , break19_g80338[ 1 ][ 3 ] , break19_g80338[ 2 ][ 3 ]));
				half3 ObjectData20_g80340 = appendResult20_g80338;
				half3 WorldData19_g80340 = ase_worldPos;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g80340 = WorldData19_g80340;
				#else
				float3 staticSwitch14_g80340 = ObjectData20_g80340;
				#endif
				float3 temp_output_114_0_g80338 = staticSwitch14_g80340;
				float3 vertexToFrag4224_g80308 = temp_output_114_0_g80338;
				float3 ObjectPosition4223_g80308 = vertexToFrag4224_g80308;
				float3 lerpResult7746_g80308 = lerp( WorldPosition3905_g80308 , ObjectPosition4223_g80308 , _MotionPosition_10);
				float3 Motion_10_Position7745_g80308 = lerpResult7746_g80308;
				half3 Input_Position419_g80317 = Motion_10_Position7745_g80308;
				float Input_MotionScale287_g80317 = ( _MotionScale_10 + 0.2 );
				half NoiseTex_Tilling735_g80317 = TVE_NoiseTexTilling;
				float2 temp_output_597_0_g80317 = (( Input_Position419_g80317 * Input_MotionScale287_g80317 * NoiseTex_Tilling735_g80317 * 0.0075 )).xz;
				float2 temp_output_447_0_g80373 = ((TVE_MotionParams).xy*2.0 + -1.0);
				half2 Global_Wind_DirectionWS4683_g80308 = temp_output_447_0_g80373;
				half2 Input_DirectionWS423_g80317 = Global_Wind_DirectionWS4683_g80308;
				float lerpResult128_g80318 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g80317 = _MotionSpeed_10;
				half Input_MotionVariation284_g80317 = _MotionVariation_10;
				half3 Input_Position167_g80354 = ObjectPosition4223_g80308;
				float dotResult156_g80354 = dot( (Input_Position167_g80354).xz , float2( 12.9898,78.233 ) );
				half Input_DynamicMode120_g80354 = 0.0;
				float Postion_Random162_g80354 = ( sin( dotResult156_g80354 ) * ( 1.0 - Input_DynamicMode120_g80354 ) );
				float4 break33_g80386 = _motion_variation_mode;
				float temp_output_30_0_g80386 = ( v.ase_color.r * break33_g80386.x );
				float temp_output_29_0_g80386 = ( v.ase_color.g * break33_g80386.y );
				float temp_output_31_0_g80386 = ( v.ase_color.b * break33_g80386.z );
				float lerpResult7828_g80308 = lerp( 0.0 , ( temp_output_30_0_g80386 + temp_output_29_0_g80386 + temp_output_31_0_g80386 + ( v.ase_color.a * break33_g80386.w ) ) , saturate( _MotionVariationMode ));
				float Mesh_Variation16_g80308 = lerpResult7828_g80308;
				half Input_Variation124_g80354 = Mesh_Variation16_g80308;
				half ObjectData20_g80356 = frac( ( Postion_Random162_g80354 + Input_Variation124_g80354 ) );
				half WorldData19_g80356 = Input_Variation124_g80354;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g80356 = WorldData19_g80356;
				#else
				float staticSwitch14_g80356 = ObjectData20_g80356;
				#endif
				float temp_output_112_0_g80354 = staticSwitch14_g80356;
				float clampResult171_g80354 = clamp( temp_output_112_0_g80354 , 0.01 , 0.99 );
				float Global_MeshVariation7760_g80308 = clampResult171_g80354;
				half Input_GlobalMeshVariation569_g80317 = Global_MeshVariation7760_g80308;
				float temp_output_630_0_g80317 = ( ( ( lerpResult128_g80318 * Input_MotionSpeed62_g80317 ) + ( Input_MotionVariation284_g80317 * Input_GlobalMeshVariation569_g80317 ) ) * 0.03 );
				float temp_output_607_0_g80317 = frac( temp_output_630_0_g80317 );
				float4 lerpResult590_g80317 = lerp( SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g80317 + ( -Input_DirectionWS423_g80317 * temp_output_607_0_g80317 ) ), 0.0 ) , SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g80317 + ( -Input_DirectionWS423_g80317 * frac( ( temp_output_630_0_g80317 + 0.5 ) ) ) ), 0.0 ) , ( abs( ( temp_output_607_0_g80317 - 0.5 ) ) / 0.5 ));
				half4 Noise_Complex703_g80317 = lerpResult590_g80317;
				float2 temp_output_645_0_g80317 = ((Noise_Complex703_g80317).rg*2.0 + -1.0);
				float2 break650_g80317 = temp_output_645_0_g80317;
				float3 appendResult649_g80317 = (float3(break650_g80317.x , 0.0 , break650_g80317.y));
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				half2 Global_Noise_OS5548_g80308 = (( mul( GetWorldToObjectMatrix(), float4( appendResult649_g80317 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_Noise_DirectionOS487_g80347 = Global_Noise_OS5548_g80308;
				float2 break448_g80373 = temp_output_447_0_g80373;
				float3 appendResult452_g80373 = (float3(break448_g80373.x , 0.0 , break448_g80373.y));
				half2 Global_Wind_DirectionOS5692_g80308 = (( mul( GetWorldToObjectMatrix(), float4( appendResult452_g80373 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_Wind_DirectionOS458_g80347 = Global_Wind_DirectionOS5692_g80308;
				float4 break322_g80373 = TVE_MotionParams;
				float lerpResult457_g80373 = lerp( break322_g80373.z , TVE_WindEditor.z , TVE_WindEditor.w);
				float temp_output_459_0_g80373 = ( 1.0 - lerpResult457_g80373 );
				half Global_Wind_Power2223_g80308 = ( 1.0 - ( temp_output_459_0_g80373 * temp_output_459_0_g80373 ) );
				half Input_WindPower449_g80347 = Global_Wind_Power2223_g80308;
				float2 lerpResult516_g80347 = lerp( Input_Noise_DirectionOS487_g80347 , Input_Wind_DirectionOS458_g80347 , ( Input_WindPower449_g80347 * 0.6 ));
				half Mesh_Height1524_g80308 = saturate( ( v.positionOS.xyz.y / _BoundsHeightValue ) );
				half Input_MeshHeight388_g80347 = Mesh_Height1524_g80308;
				half ObjectData20_g80348 = Input_MeshHeight388_g80347;
				half Input_BoundsHeight390_g80347 = 1.0;
				half WorldData19_g80348 = ( Input_MeshHeight388_g80347 * Input_MeshHeight388_g80347 * Input_BoundsHeight390_g80347 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g80348 = WorldData19_g80348;
				#else
				float staticSwitch14_g80348 = ObjectData20_g80348;
				#endif
				half Final_Motion10_Mask321_g80347 = ( staticSwitch14_g80348 * 2.0 );
				half Input_BendingAmplitude376_g80347 = _MotionAmplitude_10;
				half Global_MotionValue640_g80347 = TVE_MotionValue_10;
				half2 Final_Bending631_g80347 = ( lerpResult516_g80347 * ( Final_Motion10_Mask321_g80347 * Input_BendingAmplitude376_g80347 * Input_WindPower449_g80347 * Input_WindPower449_g80347 * Global_MotionValue640_g80347 ) );
				float2 break636_g80347 = Final_Bending631_g80347;
				float3 appendResult637_g80347 = (float3(break636_g80347.x , 0.0 , break636_g80347.y));
				half3 Motion_10_Bending216_g80308 = appendResult637_g80347;
				half3 Angle44_g80332 = Motion_10_Bending216_g80308;
				half Angle44_g80333 = (Angle44_g80332).z;
				half3 VertexPos40_g80334 = ( VertexPosRotationAxis50_g80333 + ( VertexPosOtherAxis82_g80333 * cos( Angle44_g80333 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g80333 ) * sin( Angle44_g80333 ) ) );
				float3 appendResult74_g80334 = (float3(0.0 , 0.0 , VertexPos40_g80334.z));
				half3 VertexPosRotationAxis50_g80334 = appendResult74_g80334;
				float3 break84_g80334 = VertexPos40_g80334;
				float3 appendResult81_g80334 = (float3(break84_g80334.x , break84_g80334.y , 0.0));
				half3 VertexPosOtherAxis82_g80334 = appendResult81_g80334;
				half Angle44_g80334 = -(Angle44_g80332).x;
				half3 Input_Position419_g80359 = WorldPosition3905_g80308;
				float3 break459_g80359 = Input_Position419_g80359;
				float Sum_Position446_g80359 = ( break459_g80359.x + break459_g80359.y + break459_g80359.z );
				half Input_MotionScale321_g80359 = ( _MotionScale_20 * 0.1 );
				half Input_MotionVariation330_g80359 = _MotionVariation_20;
				half Input_GlobalVariation400_g80359 = Global_MeshVariation7760_g80308;
				float lerpResult128_g80360 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g80359 = _MotionSpeed_20;
				float temp_output_404_0_g80359 = ( lerpResult128_g80360 * Input_MotionSpeed62_g80359 );
				half Motion_SineA450_g80359 = sin( ( ( Sum_Position446_g80359 * Input_MotionScale321_g80359 ) + ( Input_MotionVariation330_g80359 * Input_GlobalVariation400_g80359 ) + temp_output_404_0_g80359 ) );
				half Motion_SineB395_g80359 = sin( ( ( temp_output_404_0_g80359 * 0.6842 ) + ( Sum_Position446_g80359 * Input_MotionScale321_g80359 ) ) );
				half3 Input_Position419_g80345 = VertexPosition3588_g80308;
				float3 normalizeResult518_g80345 = normalize( Input_Position419_g80345 );
				half2 Input_DirectionOS423_g80345 = Global_Wind_DirectionOS5692_g80308;
				float2 break521_g80345 = -Input_DirectionOS423_g80345;
				float3 appendResult522_g80345 = (float3(break521_g80345.x , 0.0 , break521_g80345.y));
				float dotResult519_g80345 = dot( normalizeResult518_g80345 , appendResult522_g80345 );
				half Input_Value62_g80345 = _MotionFacingValue;
				float lerpResult524_g80345 = lerp( 1.0 , (dotResult519_g80345*0.5 + 0.5) , Input_Value62_g80345);
				half ObjectData20_g80346 = max( lerpResult524_g80345 , 0.001 );
				half WorldData19_g80346 = 1.0;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g80346 = WorldData19_g80346;
				#else
				float staticSwitch14_g80346 = ObjectData20_g80346;
				#endif
				half Motion_FacingMask7691_g80308 = staticSwitch14_g80346;
				half Motion_20_Amplitude7628_g80308 = Motion_FacingMask7691_g80308;
				half Input_MotionAmplitude384_g80359 = Motion_20_Amplitude7628_g80308;
				half Input_GlobalWind407_g80359 = Global_Wind_Power2223_g80308;
				float4 break638_g80317 = abs( Noise_Complex703_g80317 );
				half Global_Noise_B5526_g80308 = break638_g80317.b;
				half Input_GlobalNoise411_g80359 = Global_Noise_B5526_g80308;
				float lerpResult413_g80359 = lerp( 1.8 , 0.4 , Input_GlobalWind407_g80359);
				half Motion_Amplitude418_g80359 = ( Input_MotionAmplitude384_g80359 * Input_GlobalWind407_g80359 * pow( Input_GlobalNoise411_g80359 , lerpResult413_g80359 ) );
				half Input_Squash58_g80359 = _MotionAmplitude_20;
				float3 appendResult7790_g80308 = (float3(0.0 , v.positionOS.xyz.y , 0.0));
				half Mesh_Spherical7697_g80308 = saturate( ( distance( v.positionOS.xyz , appendResult7790_g80308 ) / _BoundsRadiusValue ) );
				float4 break33_g80370 = _motion_mask_mode_20;
				float temp_output_30_0_g80370 = ( v.ase_color.r * break33_g80370.x );
				float temp_output_29_0_g80370 = ( v.ase_color.g * break33_g80370.y );
				float temp_output_31_0_g80370 = ( v.ase_color.b * break33_g80370.z );
				float lerpResult7813_g80308 = lerp( Mesh_Spherical7697_g80308 , ( temp_output_30_0_g80370 + temp_output_29_0_g80370 + temp_output_31_0_g80370 + ( v.ase_color.a * break33_g80370.w ) ) , saturate( _MotionMaskMode_20 ));
				half Mesh_Motion_207834_g80308 = lerpResult7813_g80308;
				half Input_MeshMotion_20388_g80359 = Mesh_Motion_207834_g80308;
				half Input_BoundsRadius390_g80359 = 1.0;
				half Global_MotionValue462_g80359 = TVE_MotionValue_20;
				half2 Input_DirectionOS366_g80359 = Global_Wind_DirectionOS5692_g80308;
				float2 break371_g80359 = Input_DirectionOS366_g80359;
				float3 appendResult372_g80359 = (float3(break371_g80359.x , ( Motion_SineA450_g80359 * 0.3 ) , break371_g80359.y));
				half3 Motion_20_Squash7632_g80308 = ( ( (max( Motion_SineA450_g80359 , Motion_SineB395_g80359 )*0.5 + 0.5) * Motion_Amplitude418_g80359 * Input_Squash58_g80359 * Input_MeshMotion_20388_g80359 * Input_BoundsRadius390_g80359 * Global_MotionValue462_g80359 ) * appendResult372_g80359 );
				half3 VertexPos40_g80321 = ( ( VertexPosRotationAxis50_g80334 + ( VertexPosOtherAxis82_g80334 * cos( Angle44_g80334 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g80334 ) * sin( Angle44_g80334 ) ) ) + Motion_20_Squash7632_g80308 );
				float3 appendResult74_g80321 = (float3(0.0 , VertexPos40_g80321.y , 0.0));
				float3 VertexPosRotationAxis50_g80321 = appendResult74_g80321;
				float3 break84_g80321 = VertexPos40_g80321;
				float3 appendResult81_g80321 = (float3(break84_g80321.x , 0.0 , break84_g80321.z));
				float3 VertexPosOtherAxis82_g80321 = appendResult81_g80321;
				half Input_Rolling379_g80359 = _MotionAmplitude_22;
				half Motion_20_Rolling7633_g80308 = ( Motion_SineA450_g80359 * Motion_Amplitude418_g80359 * Input_Rolling379_g80359 * Input_MeshMotion_20388_g80359 * Global_MotionValue462_g80359 );
				half Angle44_g80321 = Motion_20_Rolling7633_g80308;
				half3 Input_Position500_g80326 = WorldPosition3905_g80308;
				half Input_MotionScale321_g80326 = _MotionScale_32;
				half Input_MotionVariation330_g80326 = _MotionVariation_32;
				half Input_GlobalVariation372_g80326 = Global_MeshVariation7760_g80308;
				float lerpResult128_g80327 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g80326 = _MotionSpeed_32;
				float4 tex2DNode460_g80326 = SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( ( (Input_Position500_g80326).xz * Input_MotionScale321_g80326 * 0.03 ) + ( Input_MotionVariation330_g80326 * Input_GlobalVariation372_g80326 ) + ( lerpResult128_g80327 * Input_MotionSpeed62_g80326 * 0.02 ) ), 0.0 );
				float3 appendResult462_g80326 = (float3(tex2DNode460_g80326.r , tex2DNode460_g80326.g , tex2DNode460_g80326.b));
				half3 Flutter_Texture489_g80326 = (appendResult462_g80326*2.0 + -1.0);
				half Motion_30_Amplitude7534_g80308 = ( _MotionAmplitude_32 * Motion_FacingMask7691_g80308 );
				half Input_MotionAmplitude58_g80326 = Motion_30_Amplitude7534_g80308;
				float4 break33_g80369 = _motion_mask_mode_30;
				float temp_output_30_0_g80369 = ( v.ase_color.r * break33_g80369.x );
				float temp_output_29_0_g80369 = ( v.ase_color.g * break33_g80369.y );
				float temp_output_31_0_g80369 = ( v.ase_color.b * break33_g80369.z );
				float lerpResult7820_g80308 = lerp( v.texcoord.y , ( temp_output_30_0_g80369 + temp_output_29_0_g80369 + temp_output_31_0_g80369 + ( v.ase_color.a * break33_g80369.w ) ) , saturate( _MotionMaskMode_30 ));
				half Mesh_Motion_30144_g80308 = lerpResult7820_g80308;
				half Input_MeshMotion_30374_g80326 = Mesh_Motion_30144_g80308;
				half Input_GlobalWind471_g80326 = Global_Wind_Power2223_g80308;
				half Global_MotionValue503_g80326 = TVE_MotionValue_30;
				half Input_GlobalNoise472_g80326 = Global_Noise_B5526_g80308;
				float lerpResult466_g80326 = lerp( 2.4 , 0.6 , Input_GlobalWind471_g80326);
				half Flutter_Amplitude491_g80326 = ( Input_MotionAmplitude58_g80326 * Input_MeshMotion_30374_g80326 * Input_GlobalWind471_g80326 * Global_MotionValue503_g80326 * pow( Input_GlobalNoise472_g80326 , lerpResult466_g80326 ) );
				half3 Motion_30_Flutter263_g80308 = ( Flutter_Texture489_g80326 * Flutter_Amplitude491_g80326 );
				float3 Vertex_Motion_Object7655_g80308 = ( ( ( VertexPosRotationAxis50_g80321 + ( VertexPosOtherAxis82_g80321 * cos( Angle44_g80321 ) ) + ( cross( float3(0,1,0) , VertexPosOtherAxis82_g80321 ) * sin( Angle44_g80321 ) ) ) + Motion_30_Flutter263_g80308 ) + Mesh_PivotsOS7730_g80308 );
				float3 Final_VertexPosition890_g80308 = Vertex_Motion_Object7655_g80308;
				
				float4 break33_g80365 = _second_uvs_mode;
				float2 temp_output_30_0_g80365 = ( v.texcoord.xy * break33_g80365.x );
				float2 temp_output_29_0_g80365 = ( v.ase_texcoord3.xy * break33_g80365.y );
				float2 temp_output_31_0_g80365 = ( (WorldPosition3905_g80308).xz * break33_g80365.z );
				half2 Second_UVs_Tilling7781_g80308 = (_SecondUVs).xy;
				half2 Second_UVs_Scale7782_g80308 = ( 1.0 / Second_UVs_Tilling7781_g80308 );
				float2 lerpResult7786_g80308 = lerp( Second_UVs_Tilling7781_g80308 , Second_UVs_Scale7782_g80308 , _SecondUVsScaleMode);
				half2 Second_UVs_Offset7777_g80308 = (_SecondUVs).zw;
				float2 vertexToFrag11_g80309 = ( ( ( temp_output_30_0_g80365 + temp_output_29_0_g80365 + temp_output_31_0_g80365 ) * lerpResult7786_g80308 ) + Second_UVs_Offset7777_g80308 );
				o.ase_texcoord8.zw = vertexToFrag11_g80309;
				
				o.ase_texcoord8.xy = v.texcoord.xy;
				o.ase_color = v.ase_color;
				o.ase_texcoord9 = v.positionOS;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = Final_VertexPosition890_g80308;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.positionOS.xyz = vertexValue;
				#else
					v.positionOS.xyz += vertexValue;
				#endif
				v.normalOS = v.normalOS;
				v.tangentOS = v.tangentOS;

				VertexPositionInputs vertexInput = GetVertexPositionInputs( v.positionOS.xyz );
				VertexNormalInputs normalInput = GetVertexNormalInputs( v.normalOS, v.tangentOS );

				o.tSpace0 = float4( normalInput.normalWS, vertexInput.positionWS.x );
				o.tSpace1 = float4( normalInput.tangentWS, vertexInput.positionWS.y );
				o.tSpace2 = float4( normalInput.bitangentWS, vertexInput.positionWS.z );

				#if defined(LIGHTMAP_ON)
					OUTPUT_LIGHTMAP_UV( v.texcoord1, unity_LightmapST, o.lightmapUVOrVertexSH.xy );
				#endif

				#if !defined(LIGHTMAP_ON)
					OUTPUT_SH( normalInput.normalWS.xyz, o.lightmapUVOrVertexSH.xyz );
				#endif

				#if defined(DYNAMICLIGHTMAP_ON)
					o.dynamicLightmapUV.xy = v.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
				#endif

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					o.lightmapUVOrVertexSH.zw = v.texcoord.xy;
					o.lightmapUVOrVertexSH.xy = v.texcoord.xy * unity_LightmapST.xy + unity_LightmapST.zw;
				#endif

				half3 vertexLight = VertexLighting( vertexInput.positionWS, normalInput.normalWS );

				#ifdef ASE_FOG
					half fogFactor = ComputeFogFactor( vertexInput.positionCS.z );
				#else
					half fogFactor = 0;
				#endif

				o.fogFactorAndVertexLight = half4(fogFactor, vertexLight);

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				o.positionCS = vertexInput.positionCS;
				o.clipPosV = vertexInput.positionCS;
				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 texcoord : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_color : COLOR;
				float4 ase_texcoord3 : TEXCOORD3;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.positionOS;
				o.normalOS = v.normalOS;
				o.tangentOS = v.tangentOS;
				o.texcoord = v.texcoord;
				o.texcoord1 = v.texcoord1;
				o.texcoord2 = v.texcoord2;
				o.texcoord = v.texcoord;
				o.ase_color = v.ase_color;
				o.ase_texcoord3 = v.ase_texcoord3;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.positionOS = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				o.texcoord = patch[0].texcoord * bary.x + patch[1].texcoord * bary.y + patch[2].texcoord * bary.z;
				o.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
				o.texcoord2 = patch[0].texcoord2 * bary.x + patch[1].texcoord2 * bary.y + patch[2].texcoord2 * bary.z;
				o.texcoord = patch[0].texcoord * bary.x + patch[1].texcoord * bary.y + patch[2].texcoord * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].vertex.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag ( VertexOutput IN
						#ifdef ASE_DEPTH_WRITE_ON
						,out float outputDepth : ASE_SV_DEPTH
						#endif
						#ifdef _WRITE_RENDERING_LAYERS
						, out float4 outRenderingLayers : SV_Target1
						#endif
						, bool ase_vface : SV_IsFrontFace ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(IN);

				#ifdef LOD_FADE_CROSSFADE
					LODFadeCrossFade( IN.positionCS );
				#endif

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					float2 sampleCoords = (IN.lightmapUVOrVertexSH.zw / _TerrainHeightmapRecipSize.zw + 0.5f) * _TerrainHeightmapRecipSize.xy;
					float3 WorldNormal = TransformObjectToWorldNormal(normalize(SAMPLE_TEXTURE2D(_TerrainNormalmapTexture, sampler_TerrainNormalmapTexture, sampleCoords).rgb * 2 - 1));
					float3 WorldTangent = -cross(GetObjectToWorldMatrix()._13_23_33, WorldNormal);
					float3 WorldBiTangent = cross(WorldNormal, -WorldTangent);
				#else
					float3 WorldNormal = normalize( IN.tSpace0.xyz );
					float3 WorldTangent = IN.tSpace1.xyz;
					float3 WorldBiTangent = IN.tSpace2.xyz;
				#endif

				float3 WorldPosition = float3(IN.tSpace0.w,IN.tSpace1.w,IN.tSpace2.w);
				float3 WorldViewDirection = _WorldSpaceCameraPos.xyz  - WorldPosition;
				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				float4 ClipPos = IN.clipPosV;
				float4 ScreenPos = ComputeScreenPos( IN.clipPosV );

				float2 NormalizedScreenSpaceUV = GetNormalizedScreenSpaceUV(IN.positionCS);

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					ShadowCoords = IN.shadowCoord;
				#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
					ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
				#endif

				WorldViewDirection = SafeNormalize( WorldViewDirection );

				half2 Main_UVs15_g80308 = ( ( IN.ase_texcoord8.xy * (_MainUVs).xy ) + (_MainUVs).zw );
				float4 tex2DNode29_g80308 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs15_g80308 );
				float3 lerpResult6223_g80308 = lerp( float3( 1,1,1 ) , (tex2DNode29_g80308).rgb , _MainAlbedoValue);
				float4 tex2DNode35_g80308 = SAMPLE_TEXTURE2D( _MainMaskTex, sampler_Linear_Repeat, Main_UVs15_g80308 );
				half Main_Mask57_g80308 = tex2DNode35_g80308.b;
				float clampResult17_g80376 = clamp( Main_Mask57_g80308 , 0.0001 , 0.9999 );
				float temp_output_7_0_g80377 = _MainMaskMinValue;
				float temp_output_10_0_g80377 = ( _MainMaskMaxValue - temp_output_7_0_g80377 );
				half Main_Mask_Remap5765_g80308 = saturate( ( ( clampResult17_g80376 - temp_output_7_0_g80377 ) / ( temp_output_10_0_g80377 + 0.0001 ) ) );
				float lerpResult7896_g80308 = lerp( 1.0 , Main_Mask_Remap5765_g80308 , _MainColorMode);
				float4 lerpResult7876_g80308 = lerp( _MainColorTwo , _MainColor , lerpResult7896_g80308);
				half3 Main_Color_RGB7884_g80308 = (lerpResult7876_g80308).rgb;
				half3 Main_Albedo99_g80308 = ( lerpResult6223_g80308 * Main_Color_RGB7884_g80308 );
				float2 vertexToFrag11_g80309 = IN.ase_texcoord8.zw;
				half2 Second_UVs17_g80308 = vertexToFrag11_g80309;
				float4 tex2DNode89_g80308 = SAMPLE_TEXTURE2D( _SecondAlbedoTex, sampler_SecondAlbedoTex, Second_UVs17_g80308 );
				float3 lerpResult6225_g80308 = lerp( float3( 1,1,1 ) , (tex2DNode89_g80308).rgb , _SecondAlbedoValue);
				float4 tex2DNode33_g80308 = SAMPLE_TEXTURE2D( _SecondMaskTex, sampler_Linear_Repeat, Second_UVs17_g80308 );
				half Second_Mask81_g80308 = tex2DNode33_g80308.b;
				float clampResult17_g80378 = clamp( Second_Mask81_g80308 , 0.0001 , 0.9999 );
				float temp_output_7_0_g80379 = _SecondMaskMinValue;
				float temp_output_10_0_g80379 = ( _SecondMaskMaxValue - temp_output_7_0_g80379 );
				half Second_Mask_Remap6130_g80308 = saturate( ( ( clampResult17_g80378 - temp_output_7_0_g80379 ) / ( temp_output_10_0_g80379 + 0.0001 ) ) );
				float lerpResult7897_g80308 = lerp( 1.0 , Second_Mask_Remap6130_g80308 , _SecondColorMode);
				float4 lerpResult7886_g80308 = lerp( _SecondColorTwo , _SecondColor , lerpResult7897_g80308);
				half3 Second_Color_RGB7894_g80308 = (lerpResult7886_g80308).rgb;
				half3 Second_Albedo153_g80308 = ( lerpResult6225_g80308 * Second_Color_RGB7894_g80308 );
				#ifdef UNITY_COLORSPACE_GAMMA
				float staticSwitch1_g80311 = 2.0;
				#else
				float staticSwitch1_g80311 = 4.594794;
				#endif
				float3 lerpResult4834_g80308 = lerp( ( Main_Albedo99_g80308 * Second_Albedo153_g80308 * staticSwitch1_g80311 ) , Second_Albedo153_g80308 , _DetailBlendMode);
				float lerpResult6885_g80308 = lerp( Main_Mask57_g80308 , Second_Mask81_g80308 , _DetailMaskMode);
				float clampResult17_g80325 = clamp( lerpResult6885_g80308 , 0.0001 , 0.9999 );
				float temp_output_7_0_g80324 = _DetailMaskMinValue;
				float temp_output_10_0_g80324 = ( _DetailMaskMaxValue - temp_output_7_0_g80324 );
				half Blend_Mask_Texture6794_g80308 = saturate( ( ( clampResult17_g80325 - temp_output_7_0_g80324 ) / ( temp_output_10_0_g80324 + 0.0001 ) ) );
				half4 Normal_Packed45_g80375 = SAMPLE_TEXTURE2D( _MainNormalTex, sampler_Linear_Repeat, Main_UVs15_g80308 );
				float2 appendResult58_g80375 = (float2(( (Normal_Packed45_g80375).x * (Normal_Packed45_g80375).w ) , (Normal_Packed45_g80375).y));
				half2 Normal_Default50_g80375 = appendResult58_g80375;
				half2 Normal_ASTC41_g80375 = (Normal_Packed45_g80375).xy;
				#ifdef UNITY_ASTC_NORMALMAP_ENCODING
				float2 staticSwitch38_g80375 = Normal_ASTC41_g80375;
				#else
				float2 staticSwitch38_g80375 = Normal_Default50_g80375;
				#endif
				half2 Normal_NO_DTX544_g80375 = (Normal_Packed45_g80375).wy;
				#ifdef UNITY_NO_DXT5nm
				float2 staticSwitch37_g80375 = Normal_NO_DTX544_g80375;
				#else
				float2 staticSwitch37_g80375 = staticSwitch38_g80375;
				#endif
				float2 temp_output_6555_0_g80308 = ( (staticSwitch37_g80375*2.0 + -1.0) * _MainNormalValue );
				float3 appendResult7388_g80308 = (float3(temp_output_6555_0_g80308 , 1.0));
				float3 tanToWorld0 = float3( WorldTangent.x, WorldBiTangent.x, WorldNormal.x );
				float3 tanToWorld1 = float3( WorldTangent.y, WorldBiTangent.y, WorldNormal.y );
				float3 tanToWorld2 = float3( WorldTangent.z, WorldBiTangent.z, WorldNormal.z );
				float3 tanNormal7389_g80308 = appendResult7388_g80308;
				float3 worldNormal7389_g80308 = float3(dot(tanToWorld0,tanNormal7389_g80308), dot(tanToWorld1,tanNormal7389_g80308), dot(tanToWorld2,tanNormal7389_g80308));
				half3 Main_NormalWS7390_g80308 = worldNormal7389_g80308;
				float4 break33_g80385 = _detail_mesh_mode;
				float temp_output_30_0_g80385 = ( IN.ase_color.r * break33_g80385.x );
				float temp_output_29_0_g80385 = ( IN.ase_color.g * break33_g80385.y );
				float temp_output_31_0_g80385 = ( IN.ase_color.b * break33_g80385.z );
				float lerpResult7836_g80308 = lerp( ((Main_NormalWS7390_g80308).y*0.5 + 0.5) , ( temp_output_30_0_g80385 + temp_output_29_0_g80385 + temp_output_31_0_g80385 + ( IN.ase_color.a * break33_g80385.w ) ) , saturate( _DetailMeshMode ));
				float clampResult17_g80323 = clamp( lerpResult7836_g80308 , 0.0001 , 0.9999 );
				float temp_output_7_0_g80322 = _DetailMeshMinValue;
				float temp_output_10_0_g80322 = ( _DetailMeshMaxValue - temp_output_7_0_g80322 );
				half Blend_Mask_Mesh1540_g80308 = saturate( ( ( clampResult17_g80323 - temp_output_7_0_g80322 ) / ( temp_output_10_0_g80322 + 0.0001 ) ) );
				float clampResult17_g80352 = clamp( ( Blend_Mask_Texture6794_g80308 * Blend_Mask_Mesh1540_g80308 ) , 0.0001 , 0.9999 );
				float temp_output_7_0_g80353 = _DetailBlendMinValue;
				float temp_output_10_0_g80353 = ( _DetailBlendMaxValue - temp_output_7_0_g80353 );
				half Blend_Mask147_g80308 = ( saturate( ( ( clampResult17_g80352 - temp_output_7_0_g80353 ) / ( temp_output_10_0_g80353 + 0.0001 ) ) ) * _DetailMode * _DetailValue );
				float3 lerpResult235_g80308 = lerp( Main_Albedo99_g80308 , lerpResult4834_g80308 , Blend_Mask147_g80308);
				#ifdef TVE_FEATURE_DETAIL
				float3 staticSwitch255_g80308 = lerpResult235_g80308;
				#else
				float3 staticSwitch255_g80308 = Main_Albedo99_g80308;
				#endif
				half3 Blend_Albedo265_g80308 = staticSwitch255_g80308;
				half Mesh_Height1524_g80308 = saturate( ( IN.ase_texcoord9.xyz.y / _BoundsHeightValue ) );
				float temp_output_7_0_g80367 = _GradientMinValue;
				float temp_output_10_0_g80367 = ( _GradientMaxValue - temp_output_7_0_g80367 );
				half Gradient_Value2784_g80308 = saturate( ( ( Mesh_Height1524_g80308 - temp_output_7_0_g80367 ) / ( temp_output_10_0_g80367 + 0.0001 ) ) );
				float3 lerpResult2779_g80308 = lerp( (_GradientColorTwo).rgb , (_GradientColorOne).rgb , Gradient_Value2784_g80308);
				float lerpResult6617_g80308 = lerp( Main_Mask_Remap5765_g80308 , Second_Mask_Remap6130_g80308 , Blend_Mask147_g80308);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch6623_g80308 = lerpResult6617_g80308;
				#else
				float staticSwitch6623_g80308 = Main_Mask_Remap5765_g80308;
				#endif
				half Blend_Mask_Remap6621_g80308 = staticSwitch6623_g80308;
				half Gradient_Mask6207_g80308 = Blend_Mask_Remap6621_g80308;
				float3 lerpResult6208_g80308 = lerp( float3( 1,1,1 ) , lerpResult2779_g80308 , Gradient_Mask6207_g80308);
				half3 Tint_Gradient_Color5769_g80308 = lerpResult6208_g80308;
				float3 appendResult7790_g80308 = (float3(0.0 , IN.ase_texcoord9.xyz.y , 0.0));
				half Mesh_Spherical7697_g80308 = saturate( ( distance( IN.ase_texcoord9.xyz , appendResult7790_g80308 ) / _BoundsRadiusValue ) );
				float4 break33_g80384 = _vertex_occlusion_mask_mode;
				float temp_output_30_0_g80384 = ( IN.ase_color.r * break33_g80384.x );
				float temp_output_29_0_g80384 = ( IN.ase_color.g * break33_g80384.y );
				float temp_output_31_0_g80384 = ( IN.ase_color.b * break33_g80384.z );
				float lerpResult7809_g80308 = lerp( Mesh_Spherical7697_g80308 , ( temp_output_30_0_g80384 + temp_output_29_0_g80384 + temp_output_31_0_g80384 + ( IN.ase_color.a * break33_g80384.w ) ) , saturate( _VertexOcclusionMaskMode ));
				float clampResult17_g80371 = clamp( lerpResult7809_g80308 , 0.0001 , 0.9999 );
				float temp_output_7_0_g80366 = _VertexOcclusionMinValue;
				float temp_output_10_0_g80366 = ( _VertexOcclusionMaxValue - temp_output_7_0_g80366 );
				half Occlusion_Mask6432_g80308 = saturate( ( ( clampResult17_g80371 - temp_output_7_0_g80366 ) / ( temp_output_10_0_g80366 + 0.0001 ) ) );
				float3 lerpResult2945_g80308 = lerp( (_VertexOcclusionColor).rgb , float3( 1,1,1 ) , Occlusion_Mask6432_g80308);
				half3 Occlusion_Color648_g80308 = lerpResult2945_g80308;
				half3 Blend_Albedo_Tinted2808_g80308 = ( Blend_Albedo265_g80308 * Tint_Gradient_Color5769_g80308 * Occlusion_Color648_g80308 );
				half3 Global_OverlayColor1758_g80308 = (TVE_OverlayColor).rgb;
				half Global_OverlayIntensity154_g80308 = TVE_OverlayValue;
				half Overlay_Value5738_g80308 = ( _GlobalOverlay * Global_OverlayIntensity154_g80308 );
				half2 Main_Normal137_g80308 = temp_output_6555_0_g80308;
				float2 lerpResult3372_g80308 = lerp( float2( 0,0 ) , Main_Normal137_g80308 , _DetailNormalValue);
				float3x3 ase_worldToTangent = float3x3(WorldTangent,WorldBiTangent,WorldNormal);
				half4 Normal_Packed45_g80380 = SAMPLE_TEXTURE2D( _SecondNormalTex, sampler_Linear_Repeat, Second_UVs17_g80308 );
				float2 appendResult58_g80380 = (float2(( (Normal_Packed45_g80380).x * (Normal_Packed45_g80380).w ) , (Normal_Packed45_g80380).y));
				half2 Normal_Default50_g80380 = appendResult58_g80380;
				half2 Normal_ASTC41_g80380 = (Normal_Packed45_g80380).xy;
				#ifdef UNITY_ASTC_NORMALMAP_ENCODING
				float2 staticSwitch38_g80380 = Normal_ASTC41_g80380;
				#else
				float2 staticSwitch38_g80380 = Normal_Default50_g80380;
				#endif
				half2 Normal_NO_DTX544_g80380 = (Normal_Packed45_g80380).wy;
				#ifdef UNITY_NO_DXT5nm
				float2 staticSwitch37_g80380 = Normal_NO_DTX544_g80380;
				#else
				float2 staticSwitch37_g80380 = staticSwitch38_g80380;
				#endif
				float2 temp_output_6560_0_g80308 = ( (staticSwitch37_g80380*2.0 + -1.0) * _SecondNormalValue );
				half2 Normal_Planar45_g80381 = temp_output_6560_0_g80308;
				float2 break64_g80381 = Normal_Planar45_g80381;
				float3 appendResult65_g80381 = (float3(break64_g80381.x , 0.0 , break64_g80381.y));
				float2 temp_output_7775_0_g80308 = (mul( ase_worldToTangent, appendResult65_g80381 )).xy;
				float2 ifLocalVar7776_g80308 = 0;
				if( _SecondUVsMode >= 2.0 )
				ifLocalVar7776_g80308 = temp_output_7775_0_g80308;
				else
				ifLocalVar7776_g80308 = temp_output_6560_0_g80308;
				half2 Second_Normal179_g80308 = ifLocalVar7776_g80308;
				float2 temp_output_36_0_g80312 = ( lerpResult3372_g80308 + Second_Normal179_g80308 );
				float2 lerpResult3376_g80308 = lerp( Main_Normal137_g80308 , temp_output_36_0_g80312 , Blend_Mask147_g80308);
				#ifdef TVE_FEATURE_DETAIL
				float2 staticSwitch267_g80308 = lerpResult3376_g80308;
				#else
				float2 staticSwitch267_g80308 = Main_Normal137_g80308;
				#endif
				half2 Blend_Normal312_g80308 = staticSwitch267_g80308;
				float3 appendResult7377_g80308 = (float3(Blend_Normal312_g80308 , 1.0));
				float3 tanNormal7376_g80308 = appendResult7377_g80308;
				float3 worldNormal7376_g80308 = float3(dot(tanToWorld0,tanNormal7376_g80308), dot(tanToWorld1,tanNormal7376_g80308), dot(tanToWorld2,tanNormal7376_g80308));
				half3 Blend_NormalWS7375_g80308 = worldNormal7376_g80308;
				float lerpResult7510_g80308 = lerp( 1.0 , saturate( (Blend_NormalWS7375_g80308).y ) , _OverlayProjectionValue);
				half Overlay_Projection6081_g80308 = lerpResult7510_g80308;
				float3 temp_output_3_0_g80316 = ( Blend_Albedo265_g80308 * Tint_Gradient_Color5769_g80308 );
				float dotResult20_g80316 = dot( temp_output_3_0_g80316 , float3(0.2126,0.7152,0.0722) );
				float clampResult6740_g80308 = clamp( saturate( ( dotResult20_g80316 * 5.0 ) ) , 0.2 , 1.0 );
				half Blend_Albedo_Globals6410_g80308 = clampResult6740_g80308;
				half Overlay_Shading6688_g80308 = Blend_Albedo_Globals6410_g80308;
				half Occlusion_Alpha6463_g80308 = _VertexOcclusionColor.a;
				float lerpResult7923_g80308 = lerp( Occlusion_Mask6432_g80308 , ( 1.0 - Occlusion_Mask6432_g80308 ) , _VertexOcclusionOverlayMode);
				float lerpResult7921_g80308 = lerp( Occlusion_Alpha6463_g80308 , 1.0 , lerpResult7923_g80308);
				half Occlusion_Overlay6471_g80308 = lerpResult7921_g80308;
				half Overlay_Variation4560_g80308 = 1.0;
				float temp_output_7_0_g80313 = 0.1;
				float temp_output_10_0_g80313 = ( 0.2 - temp_output_7_0_g80313 );
				half Overlay_Mask269_g80308 = saturate( ( ( ( Overlay_Value5738_g80308 * Overlay_Projection6081_g80308 * Overlay_Shading6688_g80308 * Occlusion_Overlay6471_g80308 * Overlay_Variation4560_g80308 ) - temp_output_7_0_g80313 ) / ( temp_output_10_0_g80313 + 0.0001 ) ) );
				float3 lerpResult336_g80308 = lerp( Blend_Albedo_Tinted2808_g80308 , Global_OverlayColor1758_g80308 , Overlay_Mask269_g80308);
				half3 Blend_Albedo_Overlay359_g80308 = lerpResult336_g80308;
				half3 Subsurface_Color1722_g80308 = ( (_SubsurfaceColor).rgb * Blend_Albedo_Overlay359_g80308 );
				half Global_Subsurface7580_g80308 = TVE_SubsurfaceValue;
				half Global_OverlaySubsurface5667_g80308 = TVE_OverlaySubsurface;
				float lerpResult7362_g80308 = lerp( 1.0 , Global_OverlaySubsurface5667_g80308 , Occlusion_Mask6432_g80308);
				half Overlay_Subsurface7361_g80308 = lerpResult7362_g80308;
				half Subsurface_Intensity1752_g80308 = ( _SubsurfaceValue * Global_Subsurface7580_g80308 * Overlay_Subsurface7361_g80308 );
				float lerpResult7903_g80308 = lerp( 1.0 , Blend_Mask_Remap6621_g80308 , _SubsurfaceMaskValue);
				half Subsurface_Mask1557_g80308 = lerpResult7903_g80308;
				half3 MainLight_Direction7581_g80308 = TVE_MainLightDirection;
				float3 normalizeResult7596_g80308 = normalize( WorldViewDirection );
				float3 ViewDirection7598_g80308 = normalizeResult7596_g80308;
				float dotResult7591_g80308 = dot( -MainLight_Direction7581_g80308 , ViewDirection7598_g80308 );
				float saferPower7590_g80308 = abs( saturate( dotResult7591_g80308 ) );
				#ifdef UNITY_PASS_FORWARDADD
				float staticSwitch7595_g80308 = 0.0;
				#else
				float staticSwitch7595_g80308 = ( pow( saferPower7590_g80308 , _SubsurfaceAngleValue ) * _SubsurfaceScatteringValue );
				#endif
				half Mask_Subsurface_View7587_g80308 = staticSwitch7595_g80308;
				half3 Subsurface_Approximation7607_g80308 = ( Subsurface_Color1722_g80308 * Subsurface_Intensity1752_g80308 * Subsurface_Mask1557_g80308 * Mask_Subsurface_View7587_g80308 );
				half3 Blend_Albedo_Subsurface7608_g80308 = ( Blend_Albedo_Overlay359_g80308 + Subsurface_Approximation7607_g80308 );
				
				half Global_OverlayNormalScale6581_g80308 = TVE_OverlayNormalValue;
				float lerpResult6585_g80308 = lerp( 1.0 , Global_OverlayNormalScale6581_g80308 , Overlay_Mask269_g80308);
				half2 Blend_Normal_Overlay366_g80308 = ( Blend_Normal312_g80308 * lerpResult6585_g80308 );
				float3 appendResult6568_g80308 = (float3(Blend_Normal_Overlay366_g80308 , 1.0));
				float3 temp_output_13_0_g80310 = appendResult6568_g80308;
				float3 temp_output_33_0_g80310 = ( temp_output_13_0_g80310 * _render_normals );
				float3 switchResult12_g80310 = (((ase_vface>0)?(temp_output_13_0_g80310):(temp_output_33_0_g80310)));
				
				float3 temp_cast_2 = (0.0).xxx;
				half3 Emissive_Color7162_g80308 = (_EmissiveColor).rgb;
				half2 Emissive_UVs2468_g80308 = ( ( IN.ase_texcoord8.xy * (_EmissiveUVs).xy ) + (_EmissiveUVs).zw );
				float temp_output_7_0_g80383 = _EmissiveTexMinValue;
				float3 temp_cast_3 = (temp_output_7_0_g80383).xxx;
				float temp_output_10_0_g80383 = ( _EmissiveTexMaxValue - temp_output_7_0_g80383 );
				half3 Emissive_Texture7022_g80308 = saturate( ( ( (SAMPLE_TEXTURE2D( _EmissiveTex, sampler_Linear_Repeat, Emissive_UVs2468_g80308 )).rgb - temp_cast_3 ) / ( temp_output_10_0_g80383 + 0.0001 ) ) );
				half3 Emissive_Mask6968_g80308 = Emissive_Texture7022_g80308;
				float3 temp_output_3_0_g80382 = ( Emissive_Color7162_g80308 * Emissive_Mask6968_g80308 );
				float temp_output_15_0_g80382 = _emissive_intensity_value;
				float3 temp_output_23_0_g80382 = ( temp_output_3_0_g80382 * temp_output_15_0_g80382 );
				#ifdef TVE_FEATURE_EMISSIVE
				float3 staticSwitch7912_g80308 = temp_output_23_0_g80382;
				#else
				float3 staticSwitch7912_g80308 = temp_cast_2;
				#endif
				half3 Final_Emissive2476_g80308 = staticSwitch7912_g80308;
				
				half Render_Specular4861_g80308 = _RenderSpecular;
				float3 temp_cast_4 = (( 0.04 * Render_Specular4861_g80308 )).xxx;
				
				half Main_Smoothness227_g80308 = ( tex2DNode35_g80308.a * _MainSmoothnessValue );
				half Second_Smoothness236_g80308 = ( tex2DNode33_g80308.a * _SecondSmoothnessValue );
				float lerpResult266_g80308 = lerp( Main_Smoothness227_g80308 , Second_Smoothness236_g80308 , Blend_Mask147_g80308);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch297_g80308 = lerpResult266_g80308;
				#else
				float staticSwitch297_g80308 = Main_Smoothness227_g80308;
				#endif
				half Blend_Smoothness314_g80308 = staticSwitch297_g80308;
				half Global_OverlaySmoothness311_g80308 = TVE_OverlaySmoothness;
				float lerpResult343_g80308 = lerp( Blend_Smoothness314_g80308 , Global_OverlaySmoothness311_g80308 , Overlay_Mask269_g80308);
				half Blend_Smoothness_Overlay371_g80308 = lerpResult343_g80308;
				
				float lerpResult240_g80308 = lerp( 1.0 , tex2DNode35_g80308.g , _MainOcclusionValue);
				half Main_Occlusion247_g80308 = lerpResult240_g80308;
				float lerpResult239_g80308 = lerp( 1.0 , tex2DNode33_g80308.g , _SecondOcclusionValue);
				half Second_Occlusion251_g80308 = lerpResult239_g80308;
				float lerpResult294_g80308 = lerp( Main_Occlusion247_g80308 , Second_Occlusion251_g80308 , Blend_Mask147_g80308);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch310_g80308 = lerpResult294_g80308;
				#else
				float staticSwitch310_g80308 = Main_Occlusion247_g80308;
				#endif
				half Blend_Occlusion323_g80308 = staticSwitch310_g80308;
				
				float localCustomAlphaClip19_g80314 = ( 0.0 );
				half Main_Alpha316_g80308 = tex2DNode29_g80308.a;
				half Second_Alpha5007_g80308 = tex2DNode89_g80308.a;
				float lerpResult6153_g80308 = lerp( Main_Alpha316_g80308 , Second_Alpha5007_g80308 , Blend_Mask147_g80308);
				float lerpResult6785_g80308 = lerp( ( Main_Alpha316_g80308 * Second_Alpha5007_g80308 ) , lerpResult6153_g80308 , _DetailAlphaMode);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch6158_g80308 = lerpResult6785_g80308;
				#else
				float staticSwitch6158_g80308 = Main_Alpha316_g80308;
				#endif
				half Blend_Alpha6157_g80308 = staticSwitch6158_g80308;
				half AlphaTreshold2132_g80308 = _AlphaClipValue;
				float temp_output_3_0_g80314 = ( Blend_Alpha6157_g80308 - AlphaTreshold2132_g80308 );
				float Alpha19_g80314 = temp_output_3_0_g80314;
				float temp_output_15_0_g80314 = 0.01;
				float Treshold19_g80314 = temp_output_15_0_g80314;
				{
				#if defined (TVE_FEATURE_CLIP)
				#if defined (TVE_IS_HD_PIPELINE)
				#if !defined(SHADERPASS_FORWARD_BYPASS_ALPHA_TEST) && !defined(SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST)
				clip(Alpha19_g80314 - Treshold19_g80314);
				#endif
				#else
				clip(Alpha19_g80314 - Treshold19_g80314);
				#endif
				#endif
				}
				half Final_Clip914_g80308 = Alpha19_g80314;
				

				float3 BaseColor = Blend_Albedo_Subsurface7608_g80308;
				float3 Normal = switchResult12_g80310;
				float3 Emission = Final_Emissive2476_g80308;
				float3 Specular = temp_cast_4;
				float Metallic = 0;
				float Smoothness = Blend_Smoothness_Overlay371_g80308;
				float Occlusion = Blend_Occlusion323_g80308;
				float Alpha = Final_Clip914_g80308;
				float AlphaClipThreshold = 0.5;
				float AlphaClipThresholdShadow = 0.5;
				float3 BakedGI = 0;
				float3 RefractionColor = 1;
				float RefractionIndex = 1;
				float3 Transmission = 1;
				float3 Translucency = 1;

				#ifdef ASE_DEPTH_WRITE_ON
					float DepthValue = IN.positionCS.z;
				#endif

				#ifdef _CLEARCOAT
					float CoatMask = 0;
					float CoatSmoothness = 0;
				#endif

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				InputData inputData = (InputData)0;
				inputData.positionWS = WorldPosition;
				inputData.viewDirectionWS = WorldViewDirection;

				#ifdef _NORMALMAP
						#if _NORMAL_DROPOFF_TS
							inputData.normalWS = TransformTangentToWorld(Normal, half3x3(WorldTangent, WorldBiTangent, WorldNormal));
						#elif _NORMAL_DROPOFF_OS
							inputData.normalWS = TransformObjectToWorldNormal(Normal);
						#elif _NORMAL_DROPOFF_WS
							inputData.normalWS = Normal;
						#endif
					inputData.normalWS = NormalizeNormalPerPixel(inputData.normalWS);
				#else
					inputData.normalWS = WorldNormal;
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					inputData.shadowCoord = ShadowCoords;
				#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
					inputData.shadowCoord = TransformWorldToShadowCoord(inputData.positionWS);
				#else
					inputData.shadowCoord = float4(0, 0, 0, 0);
				#endif

				#ifdef ASE_FOG
					inputData.fogCoord = IN.fogFactorAndVertexLight.x;
				#endif
					inputData.vertexLighting = IN.fogFactorAndVertexLight.yzw;

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					float3 SH = SampleSH(inputData.normalWS.xyz);
				#else
					float3 SH = IN.lightmapUVOrVertexSH.xyz;
				#endif

				#if defined(DYNAMICLIGHTMAP_ON)
					inputData.bakedGI = SAMPLE_GI(IN.lightmapUVOrVertexSH.xy, IN.dynamicLightmapUV.xy, SH, inputData.normalWS);
				#else
					inputData.bakedGI = SAMPLE_GI(IN.lightmapUVOrVertexSH.xy, SH, inputData.normalWS);
				#endif

				#ifdef ASE_BAKEDGI
					inputData.bakedGI = BakedGI;
				#endif

				inputData.normalizedScreenSpaceUV = NormalizedScreenSpaceUV;
				inputData.shadowMask = SAMPLE_SHADOWMASK(IN.lightmapUVOrVertexSH.xy);

				#if defined(DEBUG_DISPLAY)
					#if defined(DYNAMICLIGHTMAP_ON)
						inputData.dynamicLightmapUV = IN.dynamicLightmapUV.xy;
					#endif
					#if defined(LIGHTMAP_ON)
						inputData.staticLightmapUV = IN.lightmapUVOrVertexSH.xy;
					#else
						inputData.vertexSH = SH;
					#endif
				#endif

				SurfaceData surfaceData;
				surfaceData.albedo              = BaseColor;
				surfaceData.metallic            = saturate(Metallic);
				surfaceData.specular            = Specular;
				surfaceData.smoothness          = saturate(Smoothness),
				surfaceData.occlusion           = Occlusion,
				surfaceData.emission            = Emission,
				surfaceData.alpha               = saturate(Alpha);
				surfaceData.normalTS            = Normal;
				surfaceData.clearCoatMask       = 0;
				surfaceData.clearCoatSmoothness = 1;

				#ifdef _CLEARCOAT
					surfaceData.clearCoatMask       = saturate(CoatMask);
					surfaceData.clearCoatSmoothness = saturate(CoatSmoothness);
				#endif

				#ifdef _DBUFFER
					ApplyDecalToSurfaceData(IN.positionCS, surfaceData, inputData);
				#endif

				#ifdef ASE_LIGHING_SIMPLE
					half4 color = UniversalFragmentBlinnPhong( inputData, surfaceData);
				#else
					half4 color = UniversalFragmentPBR( inputData, surfaceData);
				#endif

				#ifdef ASE_TRANSMISSION
				{
					float shadow = _TransmissionShadow;

					#define SUM_LIGHT_TRANSMISSION(Light)\
						float3 atten = Light.color * Light.distanceAttenuation;\
						atten = lerp( atten, atten * Light.shadowAttenuation, shadow );\
						half3 transmission = max( 0, -dot( inputData.normalWS, Light.direction ) ) * atten * Transmission;\
						color.rgb += BaseColor * transmission;

					SUM_LIGHT_TRANSMISSION( GetMainLight( inputData.shadowCoord ) );

					#if defined(_ADDITIONAL_LIGHTS)
						uint meshRenderingLayers = GetMeshRenderingLayer();
						uint pixelLightCount = GetAdditionalLightsCount();
						#if USE_FORWARD_PLUS
							for (uint lightIndex = 0; lightIndex < min(URP_FP_DIRECTIONAL_LIGHTS_COUNT, MAX_VISIBLE_LIGHTS); lightIndex++)
							{
								FORWARD_PLUS_SUBTRACTIVE_LIGHT_CHECK

								Light light = GetAdditionalLight(lightIndex, inputData.positionWS);
								#ifdef _LIGHT_LAYERS
								if (IsMatchingLightLayer(light.layerMask, meshRenderingLayers))
								#endif
								{
									SUM_LIGHT_TRANSMISSION( light );
								}
							}
						#endif
						LIGHT_LOOP_BEGIN( pixelLightCount )
							Light light = GetAdditionalLight(lightIndex, inputData.positionWS);
							#ifdef _LIGHT_LAYERS
							if (IsMatchingLightLayer(light.layerMask, meshRenderingLayers))
							#endif
							{
								SUM_LIGHT_TRANSMISSION( light );
							}
						LIGHT_LOOP_END
					#endif
				}
				#endif

				#ifdef ASE_TRANSLUCENCY
				{
					float shadow = _TransShadow;
					float normal = _TransNormal;
					float scattering = _TransScattering;
					float direct = _TransDirect;
					float ambient = _TransAmbient;
					float strength = _TransStrength;

					#define SUM_LIGHT_TRANSLUCENCY(Light)\
						float3 atten = Light.color * Light.distanceAttenuation;\
						atten = lerp( atten, atten * Light.shadowAttenuation, shadow );\
						half3 lightDir = Light.direction + inputData.normalWS * normal;\
						half VdotL = pow( saturate( dot( inputData.viewDirectionWS, -lightDir ) ), scattering );\
						half3 translucency = atten * ( VdotL * direct + inputData.bakedGI * ambient ) * Translucency;\
						color.rgb += BaseColor * translucency * strength;

					SUM_LIGHT_TRANSLUCENCY( GetMainLight( inputData.shadowCoord ) );

					#if defined(_ADDITIONAL_LIGHTS)
						uint meshRenderingLayers = GetMeshRenderingLayer();
						uint pixelLightCount = GetAdditionalLightsCount();
						#if USE_FORWARD_PLUS
							for (uint lightIndex = 0; lightIndex < min(URP_FP_DIRECTIONAL_LIGHTS_COUNT, MAX_VISIBLE_LIGHTS); lightIndex++)
							{
								FORWARD_PLUS_SUBTRACTIVE_LIGHT_CHECK

								Light light = GetAdditionalLight(lightIndex, inputData.positionWS);
								#ifdef _LIGHT_LAYERS
								if (IsMatchingLightLayer(light.layerMask, meshRenderingLayers))
								#endif
								{
									SUM_LIGHT_TRANSLUCENCY( light );
								}
							}
						#endif
						LIGHT_LOOP_BEGIN( pixelLightCount )
							Light light = GetAdditionalLight(lightIndex, inputData.positionWS);
							#ifdef _LIGHT_LAYERS
							if (IsMatchingLightLayer(light.layerMask, meshRenderingLayers))
							#endif
							{
								SUM_LIGHT_TRANSLUCENCY( light );
							}
						LIGHT_LOOP_END
					#endif
				}
				#endif

				#ifdef ASE_REFRACTION
					float4 projScreenPos = ScreenPos / ScreenPos.w;
					float3 refractionOffset = ( RefractionIndex - 1.0 ) * mul( UNITY_MATRIX_V, float4( WorldNormal,0 ) ).xyz * ( 1.0 - dot( WorldNormal, WorldViewDirection ) );
					projScreenPos.xy += refractionOffset.xy;
					float3 refraction = SHADERGRAPH_SAMPLE_SCENE_COLOR( projScreenPos.xy ) * RefractionColor;
					color.rgb = lerp( refraction, color.rgb, color.a );
					color.a = 1;
				#endif

				#ifdef ASE_FINAL_COLOR_ALPHA_MULTIPLY
					color.rgb *= color.a;
				#endif

				#ifdef ASE_FOG
					#ifdef TERRAIN_SPLAT_ADDPASS
						color.rgb = MixFogColor(color.rgb, half3( 0, 0, 0 ), IN.fogFactorAndVertexLight.x );
					#else
						color.rgb = MixFog(color.rgb, IN.fogFactorAndVertexLight.x);
					#endif
				#endif

				#ifdef ASE_DEPTH_WRITE_ON
					outputDepth = DepthValue;
				#endif

				#ifdef _WRITE_RENDERING_LAYERS
					uint renderingLayers = GetMeshRenderingLayer();
					outRenderingLayers = float4( EncodeMeshRenderingLayer( renderingLayers ), 0, 0, 0 );
				#endif

				return color;
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "ShadowCaster"
			Tags { "LightMode"="ShadowCaster" }

			ZWrite On
			ZTest LEqual
			AlphaToMask Off
			ColorMask 0

			HLSLPROGRAM

			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define ASE_FOG 1
			#define _SPECULAR_SETUP 1
			#pragma multi_compile _ DOTS_INSTANCING_ON
			#define ASE_ABSOLUTE_VERTEX_POS 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140007
			#define ASE_USING_SAMPLING_MACROS 1


			#pragma vertex vert
			#pragma fragment frag

			#pragma multi_compile_vertex _ _CASTING_PUNCTUAL_LIGHT_SHADOW

			#define SHADERPASS SHADERPASS_SHADOWCASTER

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#if defined(LOD_FADE_CROSSFADE)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
            #endif

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_COLOR
			#pragma shader_feature_local_fragment TVE_FEATURE_CLIP
			#pragma shader_feature_local TVE_FEATURE_DETAIL
			#define TVE_IS_PLANT_SHADER
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END
			#define TVE_IS_STANDARD_SHADER
			#define THE_VEGETATION_ENGINE
			#define TVE_IS_UNIVERSAL_PIPELINE


			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE) && (SHADER_TARGET >= 45)
				#define ASE_SV_DEPTH SV_DepthLessEqual
				#define ASE_SV_POSITION_QUALIFIERS linear noperspective centroid
			#else
				#define ASE_SV_DEPTH SV_Depth
				#define ASE_SV_POSITION_QUALIFIERS
			#endif

			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_tangent : TANGENT;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				ASE_SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
				float4 clipPosV : TEXCOORD0;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 positionWS : TEXCOORD1;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					float4 shadowCoord : TEXCOORD2;
				#endif				
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _EmissiveTexRemap;
			half4 _GradientColorOne;
			half4 _GradientColorTwo;
			half4 _VertexOcclusionRemap;
			half4 _DetailBlendRemap;
			half4 _VertexOcclusionColor;
			half4 _vertex_occlusion_mask_mode;
			half4 _SecondUVs;
			float4 _GradientMaskRemap;
			half4 _second_uvs_mode;
			half4 _SecondColorTwo;
			half4 _SecondColor;
			half4 _MainColor;
			half4 _MainColorTwo;
			half4 _motion_mask_mode_20;
			half4 _DetailMeshRemap;
			half4 _SubsurfaceColor;
			float4 _SubsurfaceDiffusion_Asset;
			half4 _detail_mesh_mode;
			half4 _SecondMaskRemap;
			half4 _MainMaskRemap;
			float4 _Color;
			half4 _MainUVs;
			half4 _motion_variation_mode;
			half4 _DetailMaskRemap;
			half4 _motion_mask_mode_30;
			half4 _EmissiveUVs;
			half4 _EmissiveColor;
			half3 _render_normals;
			half _DetailBlendMode;
			half _SecondMaskMinValue;
			half _DetailMaskMode;
			half _SecondColorMode;
			half _SecondMaskMaxValue;
			half _render_cull;
			half _SecondUVsScaleMode;
			half _MainColorMode;
			half _MainMaskMaxValue;
			half _MainMaskMinValue;
			half _MainAlbedoValue;
			half _MotionMaskMode_30;
			half _MotionAmplitude_32;
			float _MotionSpeed_32;
			float _MotionVariation_32;
			float _MotionScale_32;
			half _MotionAmplitude_22;
			half _MotionMaskMode_20;
			half _SecondAlbedoValue;
			half _DetailMaskMinValue;
			half _DetailBlendMinValue;
			half _MainNormalValue;
			half _SecondOcclusionValue;
			half _MainOcclusionValue;
			half _SecondSmoothnessValue;
			half _MainSmoothnessValue;
			half _RenderSpecular;
			float _emissive_intensity_value;
			half _EmissiveTexMaxValue;
			half _EmissiveTexMinValue;
			half _SubsurfaceMaskValue;
			half _SubsurfaceValue;
			half _VertexOcclusionOverlayMode;
			half _OverlayProjectionValue;
			half _SecondNormalValue;
			half _SecondUVsMode;
			half _DetailNormalValue;
			half _GlobalOverlay;
			half _VertexOcclusionMaxValue;
			half _VertexOcclusionMinValue;
			half _VertexOcclusionMaskMode;
			half _GradientMaxValue;
			half _GradientMinValue;
			half _DetailValue;
			half _DetailMode;
			half _DetailBlendMaxValue;
			half _DetailMeshMaxValue;
			half _DetailMeshMinValue;
			half _DetailMeshMode;
			half _DetailMaskMaxValue;
			half _BoundsRadiusValue;
			half _MotionAmplitude_10;
			half _MotionFacingValue;
			half _SubsurfaceDirectValue;
			half _SubsurfaceAmbientValue;
			half _SubsurfaceShadowValue;
			half _IsVersion;
			half _MessageBounds;
			half _SpaceSubsurface;
			half _VertexVariationMode;
			half _HasEmissive;
			half _HasGradient;
			half _IsCustomShader;
			half _IsShared;
			half _IsCollected;
			half _IsIdentifier;
			half _HasOcclusion;
			half _IsTVEShader;
			half _RenderNormals;
			half _RenderMode;
			half _render_src;
			half _render_dst;
			half _render_zw;
			half _render_coverage;
			float _IsPlantShader;
			float _SubsurfaceDiffusion;
			half _SubsurfaceAngleValue;
			half _Cutoff;
			half _RenderSSR;
			half _RenderZWrite;
			half _RenderClip;
			half _RenderCull;
			half _RenderQueue;
			half _RenderPriority;
			half _RenderDecals;
			half _SubsurfaceNormalValue;
			half _SubsurfaceScatteringValue;
			half _MotionValue_30;
			half _EmissiveMode;
			half _IsLiteShader;
			half _DetailSnowMode;
			half _IsStandardShader;
			half _MotionPosition_10;
			float _MotionScale_10;
			half _EmissiveIntensityMode;
			float _MotionSpeed_10;
			half _MotionVariationMode;
			half _BoundsHeightValue;
			half _DetailAlphaMode;
			half _MotionScale_20;
			half _MotionVariation_20;
			half _MotionSpeed_20;
			half _MotionVariation_10;
			half _MotionAmplitude_20;
			half _EmissiveFlagMode;
			half _MessageOcclusion;
			half _MotionValue_20;
			half _MessageMainMask;
			half _MessageSecondMask;
			half _CategoryDetail;
			half _CategorySubsurface;
			half _CategoryEmissive;
			half _EmissiveIntensityValue;
			half _CategoryMotion;
			half _CategoryOcclusion;
			half _CategoryGradient;
			half _CategoryRender;
			half _CategoryMain;
			half _CategoryGlobals;
			half _MessageSubsurface;
			half _CategoryObject;
			half _AlphaClipValue;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);
			TEXTURE2D(_BumpMap);
			SAMPLER(sampler_BumpMap);
			TEXTURE2D(TVE_NoiseTex);
			half TVE_NoiseTexTilling;
			half4 TVE_MotionParams;
			half4 TVE_TimeParams;
			SAMPLER(sampler_Linear_Repeat);
			half4 TVE_WindEditor;
			half TVE_MotionValue_10;
			half TVE_MotionValue_20;
			half TVE_MotionValue_30;
			TEXTURE2D(_MainAlbedoTex);
			SAMPLER(sampler_MainAlbedoTex);
			TEXTURE2D(_SecondAlbedoTex);
			SAMPLER(sampler_SecondAlbedoTex);
			TEXTURE2D(_MainMaskTex);
			TEXTURE2D(_SecondMaskTex);
			TEXTURE2D(_MainNormalTex);


			
			float3 _LightDirection;
			float3 _LightPosition;

			VertexOutput VertexFunction( VertexInput v )
			{
				VertexOutput o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				float3 VertexPosition3588_g80308 = v.positionOS.xyz;
				half3 Mesh_PivotsOS7730_g80308 = half3(0,0,0);
				float3 temp_output_7738_0_g80308 = ( VertexPosition3588_g80308 - Mesh_PivotsOS7730_g80308 );
				half3 VertexPos40_g80332 = temp_output_7738_0_g80308;
				half3 VertexPos40_g80333 = VertexPos40_g80332;
				float3 appendResult74_g80333 = (float3(VertexPos40_g80333.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g80333 = appendResult74_g80333;
				float3 break84_g80333 = VertexPos40_g80333;
				float3 appendResult81_g80333 = (float3(0.0 , break84_g80333.y , break84_g80333.z));
				half3 VertexPosOtherAxis82_g80333 = appendResult81_g80333;
				float3 ase_worldPos = TransformObjectToWorld( (v.positionOS).xyz );
				float3 vertexToFrag3890_g80308 = ase_worldPos;
				float3 WorldPosition3905_g80308 = vertexToFrag3890_g80308;
				float4x4 break19_g80338 = GetObjectToWorldMatrix();
				float3 appendResult20_g80338 = (float3(break19_g80338[ 0 ][ 3 ] , break19_g80338[ 1 ][ 3 ] , break19_g80338[ 2 ][ 3 ]));
				half3 ObjectData20_g80340 = appendResult20_g80338;
				half3 WorldData19_g80340 = ase_worldPos;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g80340 = WorldData19_g80340;
				#else
				float3 staticSwitch14_g80340 = ObjectData20_g80340;
				#endif
				float3 temp_output_114_0_g80338 = staticSwitch14_g80340;
				float3 vertexToFrag4224_g80308 = temp_output_114_0_g80338;
				float3 ObjectPosition4223_g80308 = vertexToFrag4224_g80308;
				float3 lerpResult7746_g80308 = lerp( WorldPosition3905_g80308 , ObjectPosition4223_g80308 , _MotionPosition_10);
				float3 Motion_10_Position7745_g80308 = lerpResult7746_g80308;
				half3 Input_Position419_g80317 = Motion_10_Position7745_g80308;
				float Input_MotionScale287_g80317 = ( _MotionScale_10 + 0.2 );
				half NoiseTex_Tilling735_g80317 = TVE_NoiseTexTilling;
				float2 temp_output_597_0_g80317 = (( Input_Position419_g80317 * Input_MotionScale287_g80317 * NoiseTex_Tilling735_g80317 * 0.0075 )).xz;
				float2 temp_output_447_0_g80373 = ((TVE_MotionParams).xy*2.0 + -1.0);
				half2 Global_Wind_DirectionWS4683_g80308 = temp_output_447_0_g80373;
				half2 Input_DirectionWS423_g80317 = Global_Wind_DirectionWS4683_g80308;
				float lerpResult128_g80318 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g80317 = _MotionSpeed_10;
				half Input_MotionVariation284_g80317 = _MotionVariation_10;
				half3 Input_Position167_g80354 = ObjectPosition4223_g80308;
				float dotResult156_g80354 = dot( (Input_Position167_g80354).xz , float2( 12.9898,78.233 ) );
				half Input_DynamicMode120_g80354 = 0.0;
				float Postion_Random162_g80354 = ( sin( dotResult156_g80354 ) * ( 1.0 - Input_DynamicMode120_g80354 ) );
				float4 break33_g80386 = _motion_variation_mode;
				float temp_output_30_0_g80386 = ( v.ase_color.r * break33_g80386.x );
				float temp_output_29_0_g80386 = ( v.ase_color.g * break33_g80386.y );
				float temp_output_31_0_g80386 = ( v.ase_color.b * break33_g80386.z );
				float lerpResult7828_g80308 = lerp( 0.0 , ( temp_output_30_0_g80386 + temp_output_29_0_g80386 + temp_output_31_0_g80386 + ( v.ase_color.a * break33_g80386.w ) ) , saturate( _MotionVariationMode ));
				float Mesh_Variation16_g80308 = lerpResult7828_g80308;
				half Input_Variation124_g80354 = Mesh_Variation16_g80308;
				half ObjectData20_g80356 = frac( ( Postion_Random162_g80354 + Input_Variation124_g80354 ) );
				half WorldData19_g80356 = Input_Variation124_g80354;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g80356 = WorldData19_g80356;
				#else
				float staticSwitch14_g80356 = ObjectData20_g80356;
				#endif
				float temp_output_112_0_g80354 = staticSwitch14_g80356;
				float clampResult171_g80354 = clamp( temp_output_112_0_g80354 , 0.01 , 0.99 );
				float Global_MeshVariation7760_g80308 = clampResult171_g80354;
				half Input_GlobalMeshVariation569_g80317 = Global_MeshVariation7760_g80308;
				float temp_output_630_0_g80317 = ( ( ( lerpResult128_g80318 * Input_MotionSpeed62_g80317 ) + ( Input_MotionVariation284_g80317 * Input_GlobalMeshVariation569_g80317 ) ) * 0.03 );
				float temp_output_607_0_g80317 = frac( temp_output_630_0_g80317 );
				float4 lerpResult590_g80317 = lerp( SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g80317 + ( -Input_DirectionWS423_g80317 * temp_output_607_0_g80317 ) ), 0.0 ) , SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g80317 + ( -Input_DirectionWS423_g80317 * frac( ( temp_output_630_0_g80317 + 0.5 ) ) ) ), 0.0 ) , ( abs( ( temp_output_607_0_g80317 - 0.5 ) ) / 0.5 ));
				half4 Noise_Complex703_g80317 = lerpResult590_g80317;
				float2 temp_output_645_0_g80317 = ((Noise_Complex703_g80317).rg*2.0 + -1.0);
				float2 break650_g80317 = temp_output_645_0_g80317;
				float3 appendResult649_g80317 = (float3(break650_g80317.x , 0.0 , break650_g80317.y));
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				half2 Global_Noise_OS5548_g80308 = (( mul( GetWorldToObjectMatrix(), float4( appendResult649_g80317 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_Noise_DirectionOS487_g80347 = Global_Noise_OS5548_g80308;
				float2 break448_g80373 = temp_output_447_0_g80373;
				float3 appendResult452_g80373 = (float3(break448_g80373.x , 0.0 , break448_g80373.y));
				half2 Global_Wind_DirectionOS5692_g80308 = (( mul( GetWorldToObjectMatrix(), float4( appendResult452_g80373 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_Wind_DirectionOS458_g80347 = Global_Wind_DirectionOS5692_g80308;
				float4 break322_g80373 = TVE_MotionParams;
				float lerpResult457_g80373 = lerp( break322_g80373.z , TVE_WindEditor.z , TVE_WindEditor.w);
				float temp_output_459_0_g80373 = ( 1.0 - lerpResult457_g80373 );
				half Global_Wind_Power2223_g80308 = ( 1.0 - ( temp_output_459_0_g80373 * temp_output_459_0_g80373 ) );
				half Input_WindPower449_g80347 = Global_Wind_Power2223_g80308;
				float2 lerpResult516_g80347 = lerp( Input_Noise_DirectionOS487_g80347 , Input_Wind_DirectionOS458_g80347 , ( Input_WindPower449_g80347 * 0.6 ));
				half Mesh_Height1524_g80308 = saturate( ( v.positionOS.xyz.y / _BoundsHeightValue ) );
				half Input_MeshHeight388_g80347 = Mesh_Height1524_g80308;
				half ObjectData20_g80348 = Input_MeshHeight388_g80347;
				half Input_BoundsHeight390_g80347 = 1.0;
				half WorldData19_g80348 = ( Input_MeshHeight388_g80347 * Input_MeshHeight388_g80347 * Input_BoundsHeight390_g80347 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g80348 = WorldData19_g80348;
				#else
				float staticSwitch14_g80348 = ObjectData20_g80348;
				#endif
				half Final_Motion10_Mask321_g80347 = ( staticSwitch14_g80348 * 2.0 );
				half Input_BendingAmplitude376_g80347 = _MotionAmplitude_10;
				half Global_MotionValue640_g80347 = TVE_MotionValue_10;
				half2 Final_Bending631_g80347 = ( lerpResult516_g80347 * ( Final_Motion10_Mask321_g80347 * Input_BendingAmplitude376_g80347 * Input_WindPower449_g80347 * Input_WindPower449_g80347 * Global_MotionValue640_g80347 ) );
				float2 break636_g80347 = Final_Bending631_g80347;
				float3 appendResult637_g80347 = (float3(break636_g80347.x , 0.0 , break636_g80347.y));
				half3 Motion_10_Bending216_g80308 = appendResult637_g80347;
				half3 Angle44_g80332 = Motion_10_Bending216_g80308;
				half Angle44_g80333 = (Angle44_g80332).z;
				half3 VertexPos40_g80334 = ( VertexPosRotationAxis50_g80333 + ( VertexPosOtherAxis82_g80333 * cos( Angle44_g80333 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g80333 ) * sin( Angle44_g80333 ) ) );
				float3 appendResult74_g80334 = (float3(0.0 , 0.0 , VertexPos40_g80334.z));
				half3 VertexPosRotationAxis50_g80334 = appendResult74_g80334;
				float3 break84_g80334 = VertexPos40_g80334;
				float3 appendResult81_g80334 = (float3(break84_g80334.x , break84_g80334.y , 0.0));
				half3 VertexPosOtherAxis82_g80334 = appendResult81_g80334;
				half Angle44_g80334 = -(Angle44_g80332).x;
				half3 Input_Position419_g80359 = WorldPosition3905_g80308;
				float3 break459_g80359 = Input_Position419_g80359;
				float Sum_Position446_g80359 = ( break459_g80359.x + break459_g80359.y + break459_g80359.z );
				half Input_MotionScale321_g80359 = ( _MotionScale_20 * 0.1 );
				half Input_MotionVariation330_g80359 = _MotionVariation_20;
				half Input_GlobalVariation400_g80359 = Global_MeshVariation7760_g80308;
				float lerpResult128_g80360 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g80359 = _MotionSpeed_20;
				float temp_output_404_0_g80359 = ( lerpResult128_g80360 * Input_MotionSpeed62_g80359 );
				half Motion_SineA450_g80359 = sin( ( ( Sum_Position446_g80359 * Input_MotionScale321_g80359 ) + ( Input_MotionVariation330_g80359 * Input_GlobalVariation400_g80359 ) + temp_output_404_0_g80359 ) );
				half Motion_SineB395_g80359 = sin( ( ( temp_output_404_0_g80359 * 0.6842 ) + ( Sum_Position446_g80359 * Input_MotionScale321_g80359 ) ) );
				half3 Input_Position419_g80345 = VertexPosition3588_g80308;
				float3 normalizeResult518_g80345 = normalize( Input_Position419_g80345 );
				half2 Input_DirectionOS423_g80345 = Global_Wind_DirectionOS5692_g80308;
				float2 break521_g80345 = -Input_DirectionOS423_g80345;
				float3 appendResult522_g80345 = (float3(break521_g80345.x , 0.0 , break521_g80345.y));
				float dotResult519_g80345 = dot( normalizeResult518_g80345 , appendResult522_g80345 );
				half Input_Value62_g80345 = _MotionFacingValue;
				float lerpResult524_g80345 = lerp( 1.0 , (dotResult519_g80345*0.5 + 0.5) , Input_Value62_g80345);
				half ObjectData20_g80346 = max( lerpResult524_g80345 , 0.001 );
				half WorldData19_g80346 = 1.0;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g80346 = WorldData19_g80346;
				#else
				float staticSwitch14_g80346 = ObjectData20_g80346;
				#endif
				half Motion_FacingMask7691_g80308 = staticSwitch14_g80346;
				half Motion_20_Amplitude7628_g80308 = Motion_FacingMask7691_g80308;
				half Input_MotionAmplitude384_g80359 = Motion_20_Amplitude7628_g80308;
				half Input_GlobalWind407_g80359 = Global_Wind_Power2223_g80308;
				float4 break638_g80317 = abs( Noise_Complex703_g80317 );
				half Global_Noise_B5526_g80308 = break638_g80317.b;
				half Input_GlobalNoise411_g80359 = Global_Noise_B5526_g80308;
				float lerpResult413_g80359 = lerp( 1.8 , 0.4 , Input_GlobalWind407_g80359);
				half Motion_Amplitude418_g80359 = ( Input_MotionAmplitude384_g80359 * Input_GlobalWind407_g80359 * pow( Input_GlobalNoise411_g80359 , lerpResult413_g80359 ) );
				half Input_Squash58_g80359 = _MotionAmplitude_20;
				float3 appendResult7790_g80308 = (float3(0.0 , v.positionOS.xyz.y , 0.0));
				half Mesh_Spherical7697_g80308 = saturate( ( distance( v.positionOS.xyz , appendResult7790_g80308 ) / _BoundsRadiusValue ) );
				float4 break33_g80370 = _motion_mask_mode_20;
				float temp_output_30_0_g80370 = ( v.ase_color.r * break33_g80370.x );
				float temp_output_29_0_g80370 = ( v.ase_color.g * break33_g80370.y );
				float temp_output_31_0_g80370 = ( v.ase_color.b * break33_g80370.z );
				float lerpResult7813_g80308 = lerp( Mesh_Spherical7697_g80308 , ( temp_output_30_0_g80370 + temp_output_29_0_g80370 + temp_output_31_0_g80370 + ( v.ase_color.a * break33_g80370.w ) ) , saturate( _MotionMaskMode_20 ));
				half Mesh_Motion_207834_g80308 = lerpResult7813_g80308;
				half Input_MeshMotion_20388_g80359 = Mesh_Motion_207834_g80308;
				half Input_BoundsRadius390_g80359 = 1.0;
				half Global_MotionValue462_g80359 = TVE_MotionValue_20;
				half2 Input_DirectionOS366_g80359 = Global_Wind_DirectionOS5692_g80308;
				float2 break371_g80359 = Input_DirectionOS366_g80359;
				float3 appendResult372_g80359 = (float3(break371_g80359.x , ( Motion_SineA450_g80359 * 0.3 ) , break371_g80359.y));
				half3 Motion_20_Squash7632_g80308 = ( ( (max( Motion_SineA450_g80359 , Motion_SineB395_g80359 )*0.5 + 0.5) * Motion_Amplitude418_g80359 * Input_Squash58_g80359 * Input_MeshMotion_20388_g80359 * Input_BoundsRadius390_g80359 * Global_MotionValue462_g80359 ) * appendResult372_g80359 );
				half3 VertexPos40_g80321 = ( ( VertexPosRotationAxis50_g80334 + ( VertexPosOtherAxis82_g80334 * cos( Angle44_g80334 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g80334 ) * sin( Angle44_g80334 ) ) ) + Motion_20_Squash7632_g80308 );
				float3 appendResult74_g80321 = (float3(0.0 , VertexPos40_g80321.y , 0.0));
				float3 VertexPosRotationAxis50_g80321 = appendResult74_g80321;
				float3 break84_g80321 = VertexPos40_g80321;
				float3 appendResult81_g80321 = (float3(break84_g80321.x , 0.0 , break84_g80321.z));
				float3 VertexPosOtherAxis82_g80321 = appendResult81_g80321;
				half Input_Rolling379_g80359 = _MotionAmplitude_22;
				half Motion_20_Rolling7633_g80308 = ( Motion_SineA450_g80359 * Motion_Amplitude418_g80359 * Input_Rolling379_g80359 * Input_MeshMotion_20388_g80359 * Global_MotionValue462_g80359 );
				half Angle44_g80321 = Motion_20_Rolling7633_g80308;
				half3 Input_Position500_g80326 = WorldPosition3905_g80308;
				half Input_MotionScale321_g80326 = _MotionScale_32;
				half Input_MotionVariation330_g80326 = _MotionVariation_32;
				half Input_GlobalVariation372_g80326 = Global_MeshVariation7760_g80308;
				float lerpResult128_g80327 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g80326 = _MotionSpeed_32;
				float4 tex2DNode460_g80326 = SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( ( (Input_Position500_g80326).xz * Input_MotionScale321_g80326 * 0.03 ) + ( Input_MotionVariation330_g80326 * Input_GlobalVariation372_g80326 ) + ( lerpResult128_g80327 * Input_MotionSpeed62_g80326 * 0.02 ) ), 0.0 );
				float3 appendResult462_g80326 = (float3(tex2DNode460_g80326.r , tex2DNode460_g80326.g , tex2DNode460_g80326.b));
				half3 Flutter_Texture489_g80326 = (appendResult462_g80326*2.0 + -1.0);
				half Motion_30_Amplitude7534_g80308 = ( _MotionAmplitude_32 * Motion_FacingMask7691_g80308 );
				half Input_MotionAmplitude58_g80326 = Motion_30_Amplitude7534_g80308;
				float4 break33_g80369 = _motion_mask_mode_30;
				float temp_output_30_0_g80369 = ( v.ase_color.r * break33_g80369.x );
				float temp_output_29_0_g80369 = ( v.ase_color.g * break33_g80369.y );
				float temp_output_31_0_g80369 = ( v.ase_color.b * break33_g80369.z );
				float lerpResult7820_g80308 = lerp( v.ase_texcoord.y , ( temp_output_30_0_g80369 + temp_output_29_0_g80369 + temp_output_31_0_g80369 + ( v.ase_color.a * break33_g80369.w ) ) , saturate( _MotionMaskMode_30 ));
				half Mesh_Motion_30144_g80308 = lerpResult7820_g80308;
				half Input_MeshMotion_30374_g80326 = Mesh_Motion_30144_g80308;
				half Input_GlobalWind471_g80326 = Global_Wind_Power2223_g80308;
				half Global_MotionValue503_g80326 = TVE_MotionValue_30;
				half Input_GlobalNoise472_g80326 = Global_Noise_B5526_g80308;
				float lerpResult466_g80326 = lerp( 2.4 , 0.6 , Input_GlobalWind471_g80326);
				half Flutter_Amplitude491_g80326 = ( Input_MotionAmplitude58_g80326 * Input_MeshMotion_30374_g80326 * Input_GlobalWind471_g80326 * Global_MotionValue503_g80326 * pow( Input_GlobalNoise472_g80326 , lerpResult466_g80326 ) );
				half3 Motion_30_Flutter263_g80308 = ( Flutter_Texture489_g80326 * Flutter_Amplitude491_g80326 );
				float3 Vertex_Motion_Object7655_g80308 = ( ( ( VertexPosRotationAxis50_g80321 + ( VertexPosOtherAxis82_g80321 * cos( Angle44_g80321 ) ) + ( cross( float3(0,1,0) , VertexPosOtherAxis82_g80321 ) * sin( Angle44_g80321 ) ) ) + Motion_30_Flutter263_g80308 ) + Mesh_PivotsOS7730_g80308 );
				float3 Final_VertexPosition890_g80308 = Vertex_Motion_Object7655_g80308;
				
				float4 break33_g80365 = _second_uvs_mode;
				float2 temp_output_30_0_g80365 = ( v.ase_texcoord.xy * break33_g80365.x );
				float2 temp_output_29_0_g80365 = ( v.ase_texcoord3.xy * break33_g80365.y );
				float2 temp_output_31_0_g80365 = ( (WorldPosition3905_g80308).xz * break33_g80365.z );
				half2 Second_UVs_Tilling7781_g80308 = (_SecondUVs).xy;
				half2 Second_UVs_Scale7782_g80308 = ( 1.0 / Second_UVs_Tilling7781_g80308 );
				float2 lerpResult7786_g80308 = lerp( Second_UVs_Tilling7781_g80308 , Second_UVs_Scale7782_g80308 , _SecondUVsScaleMode);
				half2 Second_UVs_Offset7777_g80308 = (_SecondUVs).zw;
				float2 vertexToFrag11_g80309 = ( ( ( temp_output_30_0_g80365 + temp_output_29_0_g80365 + temp_output_31_0_g80365 ) * lerpResult7786_g80308 ) + Second_UVs_Offset7777_g80308 );
				o.ase_texcoord3.zw = vertexToFrag11_g80309;
				float3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				o.ase_texcoord4.xyz = ase_worldTangent;
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				o.ase_texcoord5.xyz = ase_worldNormal;
				float ase_vertexTangentSign = v.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord6.xyz = ase_worldBitangent;
				
				o.ase_texcoord3.xy = v.ase_texcoord.xy;
				o.ase_color = v.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord4.w = 0;
				o.ase_texcoord5.w = 0;
				o.ase_texcoord6.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = Final_VertexPosition890_g80308;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.positionOS.xyz = vertexValue;
				#else
					v.positionOS.xyz += vertexValue;
				#endif

				v.normalOS = v.normalOS;

				float3 positionWS = TransformObjectToWorld( v.positionOS.xyz );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					o.positionWS = positionWS;
				#endif

				float3 normalWS = TransformObjectToWorldDir(v.normalOS);

				#if _CASTING_PUNCTUAL_LIGHT_SHADOW
					float3 lightDirectionWS = normalize(_LightPosition - positionWS);
				#else
					float3 lightDirectionWS = _LightDirection;
				#endif

				float4 positionCS = TransformWorldToHClip(ApplyShadowBias(positionWS, normalWS, lightDirectionWS));

				#if UNITY_REVERSED_Z
					positionCS.z = min(positionCS.z, UNITY_NEAR_CLIP_VALUE);
				#else
					positionCS.z = max(positionCS.z, UNITY_NEAR_CLIP_VALUE);
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = positionCS;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				o.positionCS = positionCS;
				o.clipPosV = positionCS;
				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_tangent : TANGENT;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.positionOS;
				o.normalOS = v.normalOS;
				o.ase_color = v.ase_color;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_texcoord3 = v.ase_texcoord3;
				o.ase_tangent = v.ase_tangent;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.positionOS = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].vertex.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(	VertexOutput IN
						#ifdef ASE_DEPTH_WRITE_ON
						,out float outputDepth : ASE_SV_DEPTH
						#endif
						 ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID( IN );
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 WorldPosition = IN.positionWS;
				#endif

				float4 ShadowCoords = float4( 0, 0, 0, 0 );
				float4 ClipPos = IN.clipPosV;
				float4 ScreenPos = ComputeScreenPos( IN.clipPosV );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				float localCustomAlphaClip19_g80314 = ( 0.0 );
				half2 Main_UVs15_g80308 = ( ( IN.ase_texcoord3.xy * (_MainUVs).xy ) + (_MainUVs).zw );
				float4 tex2DNode29_g80308 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs15_g80308 );
				half Main_Alpha316_g80308 = tex2DNode29_g80308.a;
				float2 vertexToFrag11_g80309 = IN.ase_texcoord3.zw;
				half2 Second_UVs17_g80308 = vertexToFrag11_g80309;
				float4 tex2DNode89_g80308 = SAMPLE_TEXTURE2D( _SecondAlbedoTex, sampler_SecondAlbedoTex, Second_UVs17_g80308 );
				half Second_Alpha5007_g80308 = tex2DNode89_g80308.a;
				float4 tex2DNode35_g80308 = SAMPLE_TEXTURE2D( _MainMaskTex, sampler_Linear_Repeat, Main_UVs15_g80308 );
				half Main_Mask57_g80308 = tex2DNode35_g80308.b;
				float4 tex2DNode33_g80308 = SAMPLE_TEXTURE2D( _SecondMaskTex, sampler_Linear_Repeat, Second_UVs17_g80308 );
				half Second_Mask81_g80308 = tex2DNode33_g80308.b;
				float lerpResult6885_g80308 = lerp( Main_Mask57_g80308 , Second_Mask81_g80308 , _DetailMaskMode);
				float clampResult17_g80325 = clamp( lerpResult6885_g80308 , 0.0001 , 0.9999 );
				float temp_output_7_0_g80324 = _DetailMaskMinValue;
				float temp_output_10_0_g80324 = ( _DetailMaskMaxValue - temp_output_7_0_g80324 );
				half Blend_Mask_Texture6794_g80308 = saturate( ( ( clampResult17_g80325 - temp_output_7_0_g80324 ) / ( temp_output_10_0_g80324 + 0.0001 ) ) );
				half4 Normal_Packed45_g80375 = SAMPLE_TEXTURE2D( _MainNormalTex, sampler_Linear_Repeat, Main_UVs15_g80308 );
				float2 appendResult58_g80375 = (float2(( (Normal_Packed45_g80375).x * (Normal_Packed45_g80375).w ) , (Normal_Packed45_g80375).y));
				half2 Normal_Default50_g80375 = appendResult58_g80375;
				half2 Normal_ASTC41_g80375 = (Normal_Packed45_g80375).xy;
				#ifdef UNITY_ASTC_NORMALMAP_ENCODING
				float2 staticSwitch38_g80375 = Normal_ASTC41_g80375;
				#else
				float2 staticSwitch38_g80375 = Normal_Default50_g80375;
				#endif
				half2 Normal_NO_DTX544_g80375 = (Normal_Packed45_g80375).wy;
				#ifdef UNITY_NO_DXT5nm
				float2 staticSwitch37_g80375 = Normal_NO_DTX544_g80375;
				#else
				float2 staticSwitch37_g80375 = staticSwitch38_g80375;
				#endif
				float2 temp_output_6555_0_g80308 = ( (staticSwitch37_g80375*2.0 + -1.0) * _MainNormalValue );
				float3 appendResult7388_g80308 = (float3(temp_output_6555_0_g80308 , 1.0));
				float3 ase_worldTangent = IN.ase_texcoord4.xyz;
				float3 ase_worldNormal = IN.ase_texcoord5.xyz;
				float3 ase_worldBitangent = IN.ase_texcoord6.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 tanNormal7389_g80308 = appendResult7388_g80308;
				float3 worldNormal7389_g80308 = float3(dot(tanToWorld0,tanNormal7389_g80308), dot(tanToWorld1,tanNormal7389_g80308), dot(tanToWorld2,tanNormal7389_g80308));
				half3 Main_NormalWS7390_g80308 = worldNormal7389_g80308;
				float4 break33_g80385 = _detail_mesh_mode;
				float temp_output_30_0_g80385 = ( IN.ase_color.r * break33_g80385.x );
				float temp_output_29_0_g80385 = ( IN.ase_color.g * break33_g80385.y );
				float temp_output_31_0_g80385 = ( IN.ase_color.b * break33_g80385.z );
				float lerpResult7836_g80308 = lerp( ((Main_NormalWS7390_g80308).y*0.5 + 0.5) , ( temp_output_30_0_g80385 + temp_output_29_0_g80385 + temp_output_31_0_g80385 + ( IN.ase_color.a * break33_g80385.w ) ) , saturate( _DetailMeshMode ));
				float clampResult17_g80323 = clamp( lerpResult7836_g80308 , 0.0001 , 0.9999 );
				float temp_output_7_0_g80322 = _DetailMeshMinValue;
				float temp_output_10_0_g80322 = ( _DetailMeshMaxValue - temp_output_7_0_g80322 );
				half Blend_Mask_Mesh1540_g80308 = saturate( ( ( clampResult17_g80323 - temp_output_7_0_g80322 ) / ( temp_output_10_0_g80322 + 0.0001 ) ) );
				float clampResult17_g80352 = clamp( ( Blend_Mask_Texture6794_g80308 * Blend_Mask_Mesh1540_g80308 ) , 0.0001 , 0.9999 );
				float temp_output_7_0_g80353 = _DetailBlendMinValue;
				float temp_output_10_0_g80353 = ( _DetailBlendMaxValue - temp_output_7_0_g80353 );
				half Blend_Mask147_g80308 = ( saturate( ( ( clampResult17_g80352 - temp_output_7_0_g80353 ) / ( temp_output_10_0_g80353 + 0.0001 ) ) ) * _DetailMode * _DetailValue );
				float lerpResult6153_g80308 = lerp( Main_Alpha316_g80308 , Second_Alpha5007_g80308 , Blend_Mask147_g80308);
				float lerpResult6785_g80308 = lerp( ( Main_Alpha316_g80308 * Second_Alpha5007_g80308 ) , lerpResult6153_g80308 , _DetailAlphaMode);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch6158_g80308 = lerpResult6785_g80308;
				#else
				float staticSwitch6158_g80308 = Main_Alpha316_g80308;
				#endif
				half Blend_Alpha6157_g80308 = staticSwitch6158_g80308;
				half AlphaTreshold2132_g80308 = _AlphaClipValue;
				float temp_output_3_0_g80314 = ( Blend_Alpha6157_g80308 - AlphaTreshold2132_g80308 );
				float Alpha19_g80314 = temp_output_3_0_g80314;
				float temp_output_15_0_g80314 = 0.01;
				float Treshold19_g80314 = temp_output_15_0_g80314;
				{
				#if defined (TVE_FEATURE_CLIP)
				#if defined (TVE_IS_HD_PIPELINE)
				#if !defined(SHADERPASS_FORWARD_BYPASS_ALPHA_TEST) && !defined(SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST)
				clip(Alpha19_g80314 - Treshold19_g80314);
				#endif
				#else
				clip(Alpha19_g80314 - Treshold19_g80314);
				#endif
				#endif
				}
				half Final_Clip914_g80308 = Alpha19_g80314;
				

				float Alpha = Final_Clip914_g80308;
				float AlphaClipThreshold = 0.5;
				float AlphaClipThresholdShadow = 0.5;

				#ifdef ASE_DEPTH_WRITE_ON
					float DepthValue = IN.positionCS.z;
				#endif

				#ifdef _ALPHATEST_ON
					#ifdef _ALPHATEST_SHADOW_ON
						clip(Alpha - AlphaClipThresholdShadow);
					#else
						clip(Alpha - AlphaClipThreshold);
					#endif
				#endif

				#ifdef LOD_FADE_CROSSFADE
					LODFadeCrossFade( IN.positionCS );
				#endif

				#ifdef ASE_DEPTH_WRITE_ON
					outputDepth = DepthValue;
				#endif

				return 0;
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "DepthOnly"
			Tags { "LightMode"="DepthOnly" }

			ZWrite On
			ColorMask 0
			AlphaToMask Off

			HLSLPROGRAM

			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define ASE_FOG 1
			#define _SPECULAR_SETUP 1
			#pragma multi_compile _ DOTS_INSTANCING_ON
			#define ASE_ABSOLUTE_VERTEX_POS 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140007
			#define ASE_USING_SAMPLING_MACROS 1


			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS SHADERPASS_DEPTHONLY

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#if defined(LOD_FADE_CROSSFADE)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
            #endif

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_COLOR
			#pragma shader_feature_local_fragment TVE_FEATURE_CLIP
			#pragma shader_feature_local TVE_FEATURE_DETAIL
			#define TVE_IS_PLANT_SHADER
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END
			#define TVE_IS_STANDARD_SHADER
			#define THE_VEGETATION_ENGINE
			#define TVE_IS_UNIVERSAL_PIPELINE


			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE) && (SHADER_TARGET >= 45)
				#define ASE_SV_DEPTH SV_DepthLessEqual
				#define ASE_SV_POSITION_QUALIFIERS linear noperspective centroid
			#else
				#define ASE_SV_DEPTH SV_Depth
				#define ASE_SV_POSITION_QUALIFIERS
			#endif

			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_tangent : TANGENT;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				ASE_SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
				float4 clipPosV : TEXCOORD0;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 positionWS : TEXCOORD1;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
				float4 shadowCoord : TEXCOORD2;
				#endif
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _EmissiveTexRemap;
			half4 _GradientColorOne;
			half4 _GradientColorTwo;
			half4 _VertexOcclusionRemap;
			half4 _DetailBlendRemap;
			half4 _VertexOcclusionColor;
			half4 _vertex_occlusion_mask_mode;
			half4 _SecondUVs;
			float4 _GradientMaskRemap;
			half4 _second_uvs_mode;
			half4 _SecondColorTwo;
			half4 _SecondColor;
			half4 _MainColor;
			half4 _MainColorTwo;
			half4 _motion_mask_mode_20;
			half4 _DetailMeshRemap;
			half4 _SubsurfaceColor;
			float4 _SubsurfaceDiffusion_Asset;
			half4 _detail_mesh_mode;
			half4 _SecondMaskRemap;
			half4 _MainMaskRemap;
			float4 _Color;
			half4 _MainUVs;
			half4 _motion_variation_mode;
			half4 _DetailMaskRemap;
			half4 _motion_mask_mode_30;
			half4 _EmissiveUVs;
			half4 _EmissiveColor;
			half3 _render_normals;
			half _DetailBlendMode;
			half _SecondMaskMinValue;
			half _DetailMaskMode;
			half _SecondColorMode;
			half _SecondMaskMaxValue;
			half _render_cull;
			half _SecondUVsScaleMode;
			half _MainColorMode;
			half _MainMaskMaxValue;
			half _MainMaskMinValue;
			half _MainAlbedoValue;
			half _MotionMaskMode_30;
			half _MotionAmplitude_32;
			float _MotionSpeed_32;
			float _MotionVariation_32;
			float _MotionScale_32;
			half _MotionAmplitude_22;
			half _MotionMaskMode_20;
			half _SecondAlbedoValue;
			half _DetailMaskMinValue;
			half _DetailBlendMinValue;
			half _MainNormalValue;
			half _SecondOcclusionValue;
			half _MainOcclusionValue;
			half _SecondSmoothnessValue;
			half _MainSmoothnessValue;
			half _RenderSpecular;
			float _emissive_intensity_value;
			half _EmissiveTexMaxValue;
			half _EmissiveTexMinValue;
			half _SubsurfaceMaskValue;
			half _SubsurfaceValue;
			half _VertexOcclusionOverlayMode;
			half _OverlayProjectionValue;
			half _SecondNormalValue;
			half _SecondUVsMode;
			half _DetailNormalValue;
			half _GlobalOverlay;
			half _VertexOcclusionMaxValue;
			half _VertexOcclusionMinValue;
			half _VertexOcclusionMaskMode;
			half _GradientMaxValue;
			half _GradientMinValue;
			half _DetailValue;
			half _DetailMode;
			half _DetailBlendMaxValue;
			half _DetailMeshMaxValue;
			half _DetailMeshMinValue;
			half _DetailMeshMode;
			half _DetailMaskMaxValue;
			half _BoundsRadiusValue;
			half _MotionAmplitude_10;
			half _MotionFacingValue;
			half _SubsurfaceDirectValue;
			half _SubsurfaceAmbientValue;
			half _SubsurfaceShadowValue;
			half _IsVersion;
			half _MessageBounds;
			half _SpaceSubsurface;
			half _VertexVariationMode;
			half _HasEmissive;
			half _HasGradient;
			half _IsCustomShader;
			half _IsShared;
			half _IsCollected;
			half _IsIdentifier;
			half _HasOcclusion;
			half _IsTVEShader;
			half _RenderNormals;
			half _RenderMode;
			half _render_src;
			half _render_dst;
			half _render_zw;
			half _render_coverage;
			float _IsPlantShader;
			float _SubsurfaceDiffusion;
			half _SubsurfaceAngleValue;
			half _Cutoff;
			half _RenderSSR;
			half _RenderZWrite;
			half _RenderClip;
			half _RenderCull;
			half _RenderQueue;
			half _RenderPriority;
			half _RenderDecals;
			half _SubsurfaceNormalValue;
			half _SubsurfaceScatteringValue;
			half _MotionValue_30;
			half _EmissiveMode;
			half _IsLiteShader;
			half _DetailSnowMode;
			half _IsStandardShader;
			half _MotionPosition_10;
			float _MotionScale_10;
			half _EmissiveIntensityMode;
			float _MotionSpeed_10;
			half _MotionVariationMode;
			half _BoundsHeightValue;
			half _DetailAlphaMode;
			half _MotionScale_20;
			half _MotionVariation_20;
			half _MotionSpeed_20;
			half _MotionVariation_10;
			half _MotionAmplitude_20;
			half _EmissiveFlagMode;
			half _MessageOcclusion;
			half _MotionValue_20;
			half _MessageMainMask;
			half _MessageSecondMask;
			half _CategoryDetail;
			half _CategorySubsurface;
			half _CategoryEmissive;
			half _EmissiveIntensityValue;
			half _CategoryMotion;
			half _CategoryOcclusion;
			half _CategoryGradient;
			half _CategoryRender;
			half _CategoryMain;
			half _CategoryGlobals;
			half _MessageSubsurface;
			half _CategoryObject;
			half _AlphaClipValue;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);
			TEXTURE2D(_BumpMap);
			SAMPLER(sampler_BumpMap);
			TEXTURE2D(TVE_NoiseTex);
			half TVE_NoiseTexTilling;
			half4 TVE_MotionParams;
			half4 TVE_TimeParams;
			SAMPLER(sampler_Linear_Repeat);
			half4 TVE_WindEditor;
			half TVE_MotionValue_10;
			half TVE_MotionValue_20;
			half TVE_MotionValue_30;
			TEXTURE2D(_MainAlbedoTex);
			SAMPLER(sampler_MainAlbedoTex);
			TEXTURE2D(_SecondAlbedoTex);
			SAMPLER(sampler_SecondAlbedoTex);
			TEXTURE2D(_MainMaskTex);
			TEXTURE2D(_SecondMaskTex);
			TEXTURE2D(_MainNormalTex);


			
			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float3 VertexPosition3588_g80308 = v.positionOS.xyz;
				half3 Mesh_PivotsOS7730_g80308 = half3(0,0,0);
				float3 temp_output_7738_0_g80308 = ( VertexPosition3588_g80308 - Mesh_PivotsOS7730_g80308 );
				half3 VertexPos40_g80332 = temp_output_7738_0_g80308;
				half3 VertexPos40_g80333 = VertexPos40_g80332;
				float3 appendResult74_g80333 = (float3(VertexPos40_g80333.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g80333 = appendResult74_g80333;
				float3 break84_g80333 = VertexPos40_g80333;
				float3 appendResult81_g80333 = (float3(0.0 , break84_g80333.y , break84_g80333.z));
				half3 VertexPosOtherAxis82_g80333 = appendResult81_g80333;
				float3 ase_worldPos = TransformObjectToWorld( (v.positionOS).xyz );
				float3 vertexToFrag3890_g80308 = ase_worldPos;
				float3 WorldPosition3905_g80308 = vertexToFrag3890_g80308;
				float4x4 break19_g80338 = GetObjectToWorldMatrix();
				float3 appendResult20_g80338 = (float3(break19_g80338[ 0 ][ 3 ] , break19_g80338[ 1 ][ 3 ] , break19_g80338[ 2 ][ 3 ]));
				half3 ObjectData20_g80340 = appendResult20_g80338;
				half3 WorldData19_g80340 = ase_worldPos;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g80340 = WorldData19_g80340;
				#else
				float3 staticSwitch14_g80340 = ObjectData20_g80340;
				#endif
				float3 temp_output_114_0_g80338 = staticSwitch14_g80340;
				float3 vertexToFrag4224_g80308 = temp_output_114_0_g80338;
				float3 ObjectPosition4223_g80308 = vertexToFrag4224_g80308;
				float3 lerpResult7746_g80308 = lerp( WorldPosition3905_g80308 , ObjectPosition4223_g80308 , _MotionPosition_10);
				float3 Motion_10_Position7745_g80308 = lerpResult7746_g80308;
				half3 Input_Position419_g80317 = Motion_10_Position7745_g80308;
				float Input_MotionScale287_g80317 = ( _MotionScale_10 + 0.2 );
				half NoiseTex_Tilling735_g80317 = TVE_NoiseTexTilling;
				float2 temp_output_597_0_g80317 = (( Input_Position419_g80317 * Input_MotionScale287_g80317 * NoiseTex_Tilling735_g80317 * 0.0075 )).xz;
				float2 temp_output_447_0_g80373 = ((TVE_MotionParams).xy*2.0 + -1.0);
				half2 Global_Wind_DirectionWS4683_g80308 = temp_output_447_0_g80373;
				half2 Input_DirectionWS423_g80317 = Global_Wind_DirectionWS4683_g80308;
				float lerpResult128_g80318 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g80317 = _MotionSpeed_10;
				half Input_MotionVariation284_g80317 = _MotionVariation_10;
				half3 Input_Position167_g80354 = ObjectPosition4223_g80308;
				float dotResult156_g80354 = dot( (Input_Position167_g80354).xz , float2( 12.9898,78.233 ) );
				half Input_DynamicMode120_g80354 = 0.0;
				float Postion_Random162_g80354 = ( sin( dotResult156_g80354 ) * ( 1.0 - Input_DynamicMode120_g80354 ) );
				float4 break33_g80386 = _motion_variation_mode;
				float temp_output_30_0_g80386 = ( v.ase_color.r * break33_g80386.x );
				float temp_output_29_0_g80386 = ( v.ase_color.g * break33_g80386.y );
				float temp_output_31_0_g80386 = ( v.ase_color.b * break33_g80386.z );
				float lerpResult7828_g80308 = lerp( 0.0 , ( temp_output_30_0_g80386 + temp_output_29_0_g80386 + temp_output_31_0_g80386 + ( v.ase_color.a * break33_g80386.w ) ) , saturate( _MotionVariationMode ));
				float Mesh_Variation16_g80308 = lerpResult7828_g80308;
				half Input_Variation124_g80354 = Mesh_Variation16_g80308;
				half ObjectData20_g80356 = frac( ( Postion_Random162_g80354 + Input_Variation124_g80354 ) );
				half WorldData19_g80356 = Input_Variation124_g80354;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g80356 = WorldData19_g80356;
				#else
				float staticSwitch14_g80356 = ObjectData20_g80356;
				#endif
				float temp_output_112_0_g80354 = staticSwitch14_g80356;
				float clampResult171_g80354 = clamp( temp_output_112_0_g80354 , 0.01 , 0.99 );
				float Global_MeshVariation7760_g80308 = clampResult171_g80354;
				half Input_GlobalMeshVariation569_g80317 = Global_MeshVariation7760_g80308;
				float temp_output_630_0_g80317 = ( ( ( lerpResult128_g80318 * Input_MotionSpeed62_g80317 ) + ( Input_MotionVariation284_g80317 * Input_GlobalMeshVariation569_g80317 ) ) * 0.03 );
				float temp_output_607_0_g80317 = frac( temp_output_630_0_g80317 );
				float4 lerpResult590_g80317 = lerp( SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g80317 + ( -Input_DirectionWS423_g80317 * temp_output_607_0_g80317 ) ), 0.0 ) , SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g80317 + ( -Input_DirectionWS423_g80317 * frac( ( temp_output_630_0_g80317 + 0.5 ) ) ) ), 0.0 ) , ( abs( ( temp_output_607_0_g80317 - 0.5 ) ) / 0.5 ));
				half4 Noise_Complex703_g80317 = lerpResult590_g80317;
				float2 temp_output_645_0_g80317 = ((Noise_Complex703_g80317).rg*2.0 + -1.0);
				float2 break650_g80317 = temp_output_645_0_g80317;
				float3 appendResult649_g80317 = (float3(break650_g80317.x , 0.0 , break650_g80317.y));
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				half2 Global_Noise_OS5548_g80308 = (( mul( GetWorldToObjectMatrix(), float4( appendResult649_g80317 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_Noise_DirectionOS487_g80347 = Global_Noise_OS5548_g80308;
				float2 break448_g80373 = temp_output_447_0_g80373;
				float3 appendResult452_g80373 = (float3(break448_g80373.x , 0.0 , break448_g80373.y));
				half2 Global_Wind_DirectionOS5692_g80308 = (( mul( GetWorldToObjectMatrix(), float4( appendResult452_g80373 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_Wind_DirectionOS458_g80347 = Global_Wind_DirectionOS5692_g80308;
				float4 break322_g80373 = TVE_MotionParams;
				float lerpResult457_g80373 = lerp( break322_g80373.z , TVE_WindEditor.z , TVE_WindEditor.w);
				float temp_output_459_0_g80373 = ( 1.0 - lerpResult457_g80373 );
				half Global_Wind_Power2223_g80308 = ( 1.0 - ( temp_output_459_0_g80373 * temp_output_459_0_g80373 ) );
				half Input_WindPower449_g80347 = Global_Wind_Power2223_g80308;
				float2 lerpResult516_g80347 = lerp( Input_Noise_DirectionOS487_g80347 , Input_Wind_DirectionOS458_g80347 , ( Input_WindPower449_g80347 * 0.6 ));
				half Mesh_Height1524_g80308 = saturate( ( v.positionOS.xyz.y / _BoundsHeightValue ) );
				half Input_MeshHeight388_g80347 = Mesh_Height1524_g80308;
				half ObjectData20_g80348 = Input_MeshHeight388_g80347;
				half Input_BoundsHeight390_g80347 = 1.0;
				half WorldData19_g80348 = ( Input_MeshHeight388_g80347 * Input_MeshHeight388_g80347 * Input_BoundsHeight390_g80347 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g80348 = WorldData19_g80348;
				#else
				float staticSwitch14_g80348 = ObjectData20_g80348;
				#endif
				half Final_Motion10_Mask321_g80347 = ( staticSwitch14_g80348 * 2.0 );
				half Input_BendingAmplitude376_g80347 = _MotionAmplitude_10;
				half Global_MotionValue640_g80347 = TVE_MotionValue_10;
				half2 Final_Bending631_g80347 = ( lerpResult516_g80347 * ( Final_Motion10_Mask321_g80347 * Input_BendingAmplitude376_g80347 * Input_WindPower449_g80347 * Input_WindPower449_g80347 * Global_MotionValue640_g80347 ) );
				float2 break636_g80347 = Final_Bending631_g80347;
				float3 appendResult637_g80347 = (float3(break636_g80347.x , 0.0 , break636_g80347.y));
				half3 Motion_10_Bending216_g80308 = appendResult637_g80347;
				half3 Angle44_g80332 = Motion_10_Bending216_g80308;
				half Angle44_g80333 = (Angle44_g80332).z;
				half3 VertexPos40_g80334 = ( VertexPosRotationAxis50_g80333 + ( VertexPosOtherAxis82_g80333 * cos( Angle44_g80333 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g80333 ) * sin( Angle44_g80333 ) ) );
				float3 appendResult74_g80334 = (float3(0.0 , 0.0 , VertexPos40_g80334.z));
				half3 VertexPosRotationAxis50_g80334 = appendResult74_g80334;
				float3 break84_g80334 = VertexPos40_g80334;
				float3 appendResult81_g80334 = (float3(break84_g80334.x , break84_g80334.y , 0.0));
				half3 VertexPosOtherAxis82_g80334 = appendResult81_g80334;
				half Angle44_g80334 = -(Angle44_g80332).x;
				half3 Input_Position419_g80359 = WorldPosition3905_g80308;
				float3 break459_g80359 = Input_Position419_g80359;
				float Sum_Position446_g80359 = ( break459_g80359.x + break459_g80359.y + break459_g80359.z );
				half Input_MotionScale321_g80359 = ( _MotionScale_20 * 0.1 );
				half Input_MotionVariation330_g80359 = _MotionVariation_20;
				half Input_GlobalVariation400_g80359 = Global_MeshVariation7760_g80308;
				float lerpResult128_g80360 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g80359 = _MotionSpeed_20;
				float temp_output_404_0_g80359 = ( lerpResult128_g80360 * Input_MotionSpeed62_g80359 );
				half Motion_SineA450_g80359 = sin( ( ( Sum_Position446_g80359 * Input_MotionScale321_g80359 ) + ( Input_MotionVariation330_g80359 * Input_GlobalVariation400_g80359 ) + temp_output_404_0_g80359 ) );
				half Motion_SineB395_g80359 = sin( ( ( temp_output_404_0_g80359 * 0.6842 ) + ( Sum_Position446_g80359 * Input_MotionScale321_g80359 ) ) );
				half3 Input_Position419_g80345 = VertexPosition3588_g80308;
				float3 normalizeResult518_g80345 = normalize( Input_Position419_g80345 );
				half2 Input_DirectionOS423_g80345 = Global_Wind_DirectionOS5692_g80308;
				float2 break521_g80345 = -Input_DirectionOS423_g80345;
				float3 appendResult522_g80345 = (float3(break521_g80345.x , 0.0 , break521_g80345.y));
				float dotResult519_g80345 = dot( normalizeResult518_g80345 , appendResult522_g80345 );
				half Input_Value62_g80345 = _MotionFacingValue;
				float lerpResult524_g80345 = lerp( 1.0 , (dotResult519_g80345*0.5 + 0.5) , Input_Value62_g80345);
				half ObjectData20_g80346 = max( lerpResult524_g80345 , 0.001 );
				half WorldData19_g80346 = 1.0;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g80346 = WorldData19_g80346;
				#else
				float staticSwitch14_g80346 = ObjectData20_g80346;
				#endif
				half Motion_FacingMask7691_g80308 = staticSwitch14_g80346;
				half Motion_20_Amplitude7628_g80308 = Motion_FacingMask7691_g80308;
				half Input_MotionAmplitude384_g80359 = Motion_20_Amplitude7628_g80308;
				half Input_GlobalWind407_g80359 = Global_Wind_Power2223_g80308;
				float4 break638_g80317 = abs( Noise_Complex703_g80317 );
				half Global_Noise_B5526_g80308 = break638_g80317.b;
				half Input_GlobalNoise411_g80359 = Global_Noise_B5526_g80308;
				float lerpResult413_g80359 = lerp( 1.8 , 0.4 , Input_GlobalWind407_g80359);
				half Motion_Amplitude418_g80359 = ( Input_MotionAmplitude384_g80359 * Input_GlobalWind407_g80359 * pow( Input_GlobalNoise411_g80359 , lerpResult413_g80359 ) );
				half Input_Squash58_g80359 = _MotionAmplitude_20;
				float3 appendResult7790_g80308 = (float3(0.0 , v.positionOS.xyz.y , 0.0));
				half Mesh_Spherical7697_g80308 = saturate( ( distance( v.positionOS.xyz , appendResult7790_g80308 ) / _BoundsRadiusValue ) );
				float4 break33_g80370 = _motion_mask_mode_20;
				float temp_output_30_0_g80370 = ( v.ase_color.r * break33_g80370.x );
				float temp_output_29_0_g80370 = ( v.ase_color.g * break33_g80370.y );
				float temp_output_31_0_g80370 = ( v.ase_color.b * break33_g80370.z );
				float lerpResult7813_g80308 = lerp( Mesh_Spherical7697_g80308 , ( temp_output_30_0_g80370 + temp_output_29_0_g80370 + temp_output_31_0_g80370 + ( v.ase_color.a * break33_g80370.w ) ) , saturate( _MotionMaskMode_20 ));
				half Mesh_Motion_207834_g80308 = lerpResult7813_g80308;
				half Input_MeshMotion_20388_g80359 = Mesh_Motion_207834_g80308;
				half Input_BoundsRadius390_g80359 = 1.0;
				half Global_MotionValue462_g80359 = TVE_MotionValue_20;
				half2 Input_DirectionOS366_g80359 = Global_Wind_DirectionOS5692_g80308;
				float2 break371_g80359 = Input_DirectionOS366_g80359;
				float3 appendResult372_g80359 = (float3(break371_g80359.x , ( Motion_SineA450_g80359 * 0.3 ) , break371_g80359.y));
				half3 Motion_20_Squash7632_g80308 = ( ( (max( Motion_SineA450_g80359 , Motion_SineB395_g80359 )*0.5 + 0.5) * Motion_Amplitude418_g80359 * Input_Squash58_g80359 * Input_MeshMotion_20388_g80359 * Input_BoundsRadius390_g80359 * Global_MotionValue462_g80359 ) * appendResult372_g80359 );
				half3 VertexPos40_g80321 = ( ( VertexPosRotationAxis50_g80334 + ( VertexPosOtherAxis82_g80334 * cos( Angle44_g80334 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g80334 ) * sin( Angle44_g80334 ) ) ) + Motion_20_Squash7632_g80308 );
				float3 appendResult74_g80321 = (float3(0.0 , VertexPos40_g80321.y , 0.0));
				float3 VertexPosRotationAxis50_g80321 = appendResult74_g80321;
				float3 break84_g80321 = VertexPos40_g80321;
				float3 appendResult81_g80321 = (float3(break84_g80321.x , 0.0 , break84_g80321.z));
				float3 VertexPosOtherAxis82_g80321 = appendResult81_g80321;
				half Input_Rolling379_g80359 = _MotionAmplitude_22;
				half Motion_20_Rolling7633_g80308 = ( Motion_SineA450_g80359 * Motion_Amplitude418_g80359 * Input_Rolling379_g80359 * Input_MeshMotion_20388_g80359 * Global_MotionValue462_g80359 );
				half Angle44_g80321 = Motion_20_Rolling7633_g80308;
				half3 Input_Position500_g80326 = WorldPosition3905_g80308;
				half Input_MotionScale321_g80326 = _MotionScale_32;
				half Input_MotionVariation330_g80326 = _MotionVariation_32;
				half Input_GlobalVariation372_g80326 = Global_MeshVariation7760_g80308;
				float lerpResult128_g80327 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g80326 = _MotionSpeed_32;
				float4 tex2DNode460_g80326 = SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( ( (Input_Position500_g80326).xz * Input_MotionScale321_g80326 * 0.03 ) + ( Input_MotionVariation330_g80326 * Input_GlobalVariation372_g80326 ) + ( lerpResult128_g80327 * Input_MotionSpeed62_g80326 * 0.02 ) ), 0.0 );
				float3 appendResult462_g80326 = (float3(tex2DNode460_g80326.r , tex2DNode460_g80326.g , tex2DNode460_g80326.b));
				half3 Flutter_Texture489_g80326 = (appendResult462_g80326*2.0 + -1.0);
				half Motion_30_Amplitude7534_g80308 = ( _MotionAmplitude_32 * Motion_FacingMask7691_g80308 );
				half Input_MotionAmplitude58_g80326 = Motion_30_Amplitude7534_g80308;
				float4 break33_g80369 = _motion_mask_mode_30;
				float temp_output_30_0_g80369 = ( v.ase_color.r * break33_g80369.x );
				float temp_output_29_0_g80369 = ( v.ase_color.g * break33_g80369.y );
				float temp_output_31_0_g80369 = ( v.ase_color.b * break33_g80369.z );
				float lerpResult7820_g80308 = lerp( v.ase_texcoord.y , ( temp_output_30_0_g80369 + temp_output_29_0_g80369 + temp_output_31_0_g80369 + ( v.ase_color.a * break33_g80369.w ) ) , saturate( _MotionMaskMode_30 ));
				half Mesh_Motion_30144_g80308 = lerpResult7820_g80308;
				half Input_MeshMotion_30374_g80326 = Mesh_Motion_30144_g80308;
				half Input_GlobalWind471_g80326 = Global_Wind_Power2223_g80308;
				half Global_MotionValue503_g80326 = TVE_MotionValue_30;
				half Input_GlobalNoise472_g80326 = Global_Noise_B5526_g80308;
				float lerpResult466_g80326 = lerp( 2.4 , 0.6 , Input_GlobalWind471_g80326);
				half Flutter_Amplitude491_g80326 = ( Input_MotionAmplitude58_g80326 * Input_MeshMotion_30374_g80326 * Input_GlobalWind471_g80326 * Global_MotionValue503_g80326 * pow( Input_GlobalNoise472_g80326 , lerpResult466_g80326 ) );
				half3 Motion_30_Flutter263_g80308 = ( Flutter_Texture489_g80326 * Flutter_Amplitude491_g80326 );
				float3 Vertex_Motion_Object7655_g80308 = ( ( ( VertexPosRotationAxis50_g80321 + ( VertexPosOtherAxis82_g80321 * cos( Angle44_g80321 ) ) + ( cross( float3(0,1,0) , VertexPosOtherAxis82_g80321 ) * sin( Angle44_g80321 ) ) ) + Motion_30_Flutter263_g80308 ) + Mesh_PivotsOS7730_g80308 );
				float3 Final_VertexPosition890_g80308 = Vertex_Motion_Object7655_g80308;
				
				float4 break33_g80365 = _second_uvs_mode;
				float2 temp_output_30_0_g80365 = ( v.ase_texcoord.xy * break33_g80365.x );
				float2 temp_output_29_0_g80365 = ( v.ase_texcoord3.xy * break33_g80365.y );
				float2 temp_output_31_0_g80365 = ( (WorldPosition3905_g80308).xz * break33_g80365.z );
				half2 Second_UVs_Tilling7781_g80308 = (_SecondUVs).xy;
				half2 Second_UVs_Scale7782_g80308 = ( 1.0 / Second_UVs_Tilling7781_g80308 );
				float2 lerpResult7786_g80308 = lerp( Second_UVs_Tilling7781_g80308 , Second_UVs_Scale7782_g80308 , _SecondUVsScaleMode);
				half2 Second_UVs_Offset7777_g80308 = (_SecondUVs).zw;
				float2 vertexToFrag11_g80309 = ( ( ( temp_output_30_0_g80365 + temp_output_29_0_g80365 + temp_output_31_0_g80365 ) * lerpResult7786_g80308 ) + Second_UVs_Offset7777_g80308 );
				o.ase_texcoord3.zw = vertexToFrag11_g80309;
				float3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				o.ase_texcoord4.xyz = ase_worldTangent;
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				o.ase_texcoord5.xyz = ase_worldNormal;
				float ase_vertexTangentSign = v.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord6.xyz = ase_worldBitangent;
				
				o.ase_texcoord3.xy = v.ase_texcoord.xy;
				o.ase_color = v.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord4.w = 0;
				o.ase_texcoord5.w = 0;
				o.ase_texcoord6.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = Final_VertexPosition890_g80308;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.positionOS.xyz = vertexValue;
				#else
					v.positionOS.xyz += vertexValue;
				#endif

				v.normalOS = v.normalOS;

				VertexPositionInputs vertexInput = GetVertexPositionInputs( v.positionOS.xyz );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					o.positionWS = vertexInput.positionWS;
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				o.positionCS = vertexInput.positionCS;
				o.clipPosV = vertexInput.positionCS;
				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_tangent : TANGENT;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.positionOS;
				o.normalOS = v.normalOS;
				o.ase_color = v.ase_color;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_texcoord3 = v.ase_texcoord3;
				o.ase_tangent = v.ase_tangent;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.positionOS = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].vertex.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(	VertexOutput IN
						#ifdef ASE_DEPTH_WRITE_ON
						,out float outputDepth : ASE_SV_DEPTH
						#endif
						 ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 WorldPosition = IN.positionWS;
				#endif

				float4 ShadowCoords = float4( 0, 0, 0, 0 );
				float4 ClipPos = IN.clipPosV;
				float4 ScreenPos = ComputeScreenPos( IN.clipPosV );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				float localCustomAlphaClip19_g80314 = ( 0.0 );
				half2 Main_UVs15_g80308 = ( ( IN.ase_texcoord3.xy * (_MainUVs).xy ) + (_MainUVs).zw );
				float4 tex2DNode29_g80308 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs15_g80308 );
				half Main_Alpha316_g80308 = tex2DNode29_g80308.a;
				float2 vertexToFrag11_g80309 = IN.ase_texcoord3.zw;
				half2 Second_UVs17_g80308 = vertexToFrag11_g80309;
				float4 tex2DNode89_g80308 = SAMPLE_TEXTURE2D( _SecondAlbedoTex, sampler_SecondAlbedoTex, Second_UVs17_g80308 );
				half Second_Alpha5007_g80308 = tex2DNode89_g80308.a;
				float4 tex2DNode35_g80308 = SAMPLE_TEXTURE2D( _MainMaskTex, sampler_Linear_Repeat, Main_UVs15_g80308 );
				half Main_Mask57_g80308 = tex2DNode35_g80308.b;
				float4 tex2DNode33_g80308 = SAMPLE_TEXTURE2D( _SecondMaskTex, sampler_Linear_Repeat, Second_UVs17_g80308 );
				half Second_Mask81_g80308 = tex2DNode33_g80308.b;
				float lerpResult6885_g80308 = lerp( Main_Mask57_g80308 , Second_Mask81_g80308 , _DetailMaskMode);
				float clampResult17_g80325 = clamp( lerpResult6885_g80308 , 0.0001 , 0.9999 );
				float temp_output_7_0_g80324 = _DetailMaskMinValue;
				float temp_output_10_0_g80324 = ( _DetailMaskMaxValue - temp_output_7_0_g80324 );
				half Blend_Mask_Texture6794_g80308 = saturate( ( ( clampResult17_g80325 - temp_output_7_0_g80324 ) / ( temp_output_10_0_g80324 + 0.0001 ) ) );
				half4 Normal_Packed45_g80375 = SAMPLE_TEXTURE2D( _MainNormalTex, sampler_Linear_Repeat, Main_UVs15_g80308 );
				float2 appendResult58_g80375 = (float2(( (Normal_Packed45_g80375).x * (Normal_Packed45_g80375).w ) , (Normal_Packed45_g80375).y));
				half2 Normal_Default50_g80375 = appendResult58_g80375;
				half2 Normal_ASTC41_g80375 = (Normal_Packed45_g80375).xy;
				#ifdef UNITY_ASTC_NORMALMAP_ENCODING
				float2 staticSwitch38_g80375 = Normal_ASTC41_g80375;
				#else
				float2 staticSwitch38_g80375 = Normal_Default50_g80375;
				#endif
				half2 Normal_NO_DTX544_g80375 = (Normal_Packed45_g80375).wy;
				#ifdef UNITY_NO_DXT5nm
				float2 staticSwitch37_g80375 = Normal_NO_DTX544_g80375;
				#else
				float2 staticSwitch37_g80375 = staticSwitch38_g80375;
				#endif
				float2 temp_output_6555_0_g80308 = ( (staticSwitch37_g80375*2.0 + -1.0) * _MainNormalValue );
				float3 appendResult7388_g80308 = (float3(temp_output_6555_0_g80308 , 1.0));
				float3 ase_worldTangent = IN.ase_texcoord4.xyz;
				float3 ase_worldNormal = IN.ase_texcoord5.xyz;
				float3 ase_worldBitangent = IN.ase_texcoord6.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 tanNormal7389_g80308 = appendResult7388_g80308;
				float3 worldNormal7389_g80308 = float3(dot(tanToWorld0,tanNormal7389_g80308), dot(tanToWorld1,tanNormal7389_g80308), dot(tanToWorld2,tanNormal7389_g80308));
				half3 Main_NormalWS7390_g80308 = worldNormal7389_g80308;
				float4 break33_g80385 = _detail_mesh_mode;
				float temp_output_30_0_g80385 = ( IN.ase_color.r * break33_g80385.x );
				float temp_output_29_0_g80385 = ( IN.ase_color.g * break33_g80385.y );
				float temp_output_31_0_g80385 = ( IN.ase_color.b * break33_g80385.z );
				float lerpResult7836_g80308 = lerp( ((Main_NormalWS7390_g80308).y*0.5 + 0.5) , ( temp_output_30_0_g80385 + temp_output_29_0_g80385 + temp_output_31_0_g80385 + ( IN.ase_color.a * break33_g80385.w ) ) , saturate( _DetailMeshMode ));
				float clampResult17_g80323 = clamp( lerpResult7836_g80308 , 0.0001 , 0.9999 );
				float temp_output_7_0_g80322 = _DetailMeshMinValue;
				float temp_output_10_0_g80322 = ( _DetailMeshMaxValue - temp_output_7_0_g80322 );
				half Blend_Mask_Mesh1540_g80308 = saturate( ( ( clampResult17_g80323 - temp_output_7_0_g80322 ) / ( temp_output_10_0_g80322 + 0.0001 ) ) );
				float clampResult17_g80352 = clamp( ( Blend_Mask_Texture6794_g80308 * Blend_Mask_Mesh1540_g80308 ) , 0.0001 , 0.9999 );
				float temp_output_7_0_g80353 = _DetailBlendMinValue;
				float temp_output_10_0_g80353 = ( _DetailBlendMaxValue - temp_output_7_0_g80353 );
				half Blend_Mask147_g80308 = ( saturate( ( ( clampResult17_g80352 - temp_output_7_0_g80353 ) / ( temp_output_10_0_g80353 + 0.0001 ) ) ) * _DetailMode * _DetailValue );
				float lerpResult6153_g80308 = lerp( Main_Alpha316_g80308 , Second_Alpha5007_g80308 , Blend_Mask147_g80308);
				float lerpResult6785_g80308 = lerp( ( Main_Alpha316_g80308 * Second_Alpha5007_g80308 ) , lerpResult6153_g80308 , _DetailAlphaMode);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch6158_g80308 = lerpResult6785_g80308;
				#else
				float staticSwitch6158_g80308 = Main_Alpha316_g80308;
				#endif
				half Blend_Alpha6157_g80308 = staticSwitch6158_g80308;
				half AlphaTreshold2132_g80308 = _AlphaClipValue;
				float temp_output_3_0_g80314 = ( Blend_Alpha6157_g80308 - AlphaTreshold2132_g80308 );
				float Alpha19_g80314 = temp_output_3_0_g80314;
				float temp_output_15_0_g80314 = 0.01;
				float Treshold19_g80314 = temp_output_15_0_g80314;
				{
				#if defined (TVE_FEATURE_CLIP)
				#if defined (TVE_IS_HD_PIPELINE)
				#if !defined(SHADERPASS_FORWARD_BYPASS_ALPHA_TEST) && !defined(SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST)
				clip(Alpha19_g80314 - Treshold19_g80314);
				#endif
				#else
				clip(Alpha19_g80314 - Treshold19_g80314);
				#endif
				#endif
				}
				half Final_Clip914_g80308 = Alpha19_g80314;
				

				float Alpha = Final_Clip914_g80308;
				float AlphaClipThreshold = 0.5;

				#ifdef ASE_DEPTH_WRITE_ON
					float DepthValue = IN.positionCS.z;
				#endif

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				#ifdef LOD_FADE_CROSSFADE
					LODFadeCrossFade( IN.positionCS );
				#endif

				#ifdef ASE_DEPTH_WRITE_ON
					outputDepth = DepthValue;
				#endif

				return 0;
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "Meta"
			Tags { "LightMode"="Meta" }

			Cull Off

			HLSLPROGRAM

			#define _NORMAL_DROPOFF_TS 1
			#define ASE_FOG 1
			#define _SPECULAR_SETUP 1
			#define ASE_ABSOLUTE_VERTEX_POS 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140007
			#define ASE_USING_SAMPLING_MACROS 1


			#pragma vertex vert
			#pragma fragment frag

			#pragma shader_feature EDITOR_VISUALIZATION

			#define SHADERPASS SHADERPASS_META

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/MetaInput.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_COLOR
			#define ASE_NEEDS_FRAG_POSITION
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#pragma shader_feature_local_fragment TVE_FEATURE_CLIP
			#pragma shader_feature_local TVE_FEATURE_DETAIL
			#pragma shader_feature_local_fragment TVE_FEATURE_EMISSIVE
			#define TVE_IS_PLANT_SHADER
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END
			#define TVE_IS_STANDARD_SHADER
			#define THE_VEGETATION_ENGINE
			#define TVE_IS_UNIVERSAL_PIPELINE


			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 texcoord0 : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_color : COLOR;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_tangent : TANGENT;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 positionCS : SV_POSITION;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 positionWS : TEXCOORD0;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					float4 shadowCoord : TEXCOORD1;
				#endif
				#ifdef EDITOR_VISUALIZATION
					float4 VizUV : TEXCOORD2;
					float4 LightCoord : TEXCOORD3;
				#endif
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
				float4 ase_texcoord7 : TEXCOORD7;
				float4 ase_color : COLOR;
				float4 ase_texcoord8 : TEXCOORD8;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _EmissiveTexRemap;
			half4 _GradientColorOne;
			half4 _GradientColorTwo;
			half4 _VertexOcclusionRemap;
			half4 _DetailBlendRemap;
			half4 _VertexOcclusionColor;
			half4 _vertex_occlusion_mask_mode;
			half4 _SecondUVs;
			float4 _GradientMaskRemap;
			half4 _second_uvs_mode;
			half4 _SecondColorTwo;
			half4 _SecondColor;
			half4 _MainColor;
			half4 _MainColorTwo;
			half4 _motion_mask_mode_20;
			half4 _DetailMeshRemap;
			half4 _SubsurfaceColor;
			float4 _SubsurfaceDiffusion_Asset;
			half4 _detail_mesh_mode;
			half4 _SecondMaskRemap;
			half4 _MainMaskRemap;
			float4 _Color;
			half4 _MainUVs;
			half4 _motion_variation_mode;
			half4 _DetailMaskRemap;
			half4 _motion_mask_mode_30;
			half4 _EmissiveUVs;
			half4 _EmissiveColor;
			half3 _render_normals;
			half _DetailBlendMode;
			half _SecondMaskMinValue;
			half _DetailMaskMode;
			half _SecondColorMode;
			half _SecondMaskMaxValue;
			half _render_cull;
			half _SecondUVsScaleMode;
			half _MainColorMode;
			half _MainMaskMaxValue;
			half _MainMaskMinValue;
			half _MainAlbedoValue;
			half _MotionMaskMode_30;
			half _MotionAmplitude_32;
			float _MotionSpeed_32;
			float _MotionVariation_32;
			float _MotionScale_32;
			half _MotionAmplitude_22;
			half _MotionMaskMode_20;
			half _SecondAlbedoValue;
			half _DetailMaskMinValue;
			half _DetailBlendMinValue;
			half _MainNormalValue;
			half _SecondOcclusionValue;
			half _MainOcclusionValue;
			half _SecondSmoothnessValue;
			half _MainSmoothnessValue;
			half _RenderSpecular;
			float _emissive_intensity_value;
			half _EmissiveTexMaxValue;
			half _EmissiveTexMinValue;
			half _SubsurfaceMaskValue;
			half _SubsurfaceValue;
			half _VertexOcclusionOverlayMode;
			half _OverlayProjectionValue;
			half _SecondNormalValue;
			half _SecondUVsMode;
			half _DetailNormalValue;
			half _GlobalOverlay;
			half _VertexOcclusionMaxValue;
			half _VertexOcclusionMinValue;
			half _VertexOcclusionMaskMode;
			half _GradientMaxValue;
			half _GradientMinValue;
			half _DetailValue;
			half _DetailMode;
			half _DetailBlendMaxValue;
			half _DetailMeshMaxValue;
			half _DetailMeshMinValue;
			half _DetailMeshMode;
			half _DetailMaskMaxValue;
			half _BoundsRadiusValue;
			half _MotionAmplitude_10;
			half _MotionFacingValue;
			half _SubsurfaceDirectValue;
			half _SubsurfaceAmbientValue;
			half _SubsurfaceShadowValue;
			half _IsVersion;
			half _MessageBounds;
			half _SpaceSubsurface;
			half _VertexVariationMode;
			half _HasEmissive;
			half _HasGradient;
			half _IsCustomShader;
			half _IsShared;
			half _IsCollected;
			half _IsIdentifier;
			half _HasOcclusion;
			half _IsTVEShader;
			half _RenderNormals;
			half _RenderMode;
			half _render_src;
			half _render_dst;
			half _render_zw;
			half _render_coverage;
			float _IsPlantShader;
			float _SubsurfaceDiffusion;
			half _SubsurfaceAngleValue;
			half _Cutoff;
			half _RenderSSR;
			half _RenderZWrite;
			half _RenderClip;
			half _RenderCull;
			half _RenderQueue;
			half _RenderPriority;
			half _RenderDecals;
			half _SubsurfaceNormalValue;
			half _SubsurfaceScatteringValue;
			half _MotionValue_30;
			half _EmissiveMode;
			half _IsLiteShader;
			half _DetailSnowMode;
			half _IsStandardShader;
			half _MotionPosition_10;
			float _MotionScale_10;
			half _EmissiveIntensityMode;
			float _MotionSpeed_10;
			half _MotionVariationMode;
			half _BoundsHeightValue;
			half _DetailAlphaMode;
			half _MotionScale_20;
			half _MotionVariation_20;
			half _MotionSpeed_20;
			half _MotionVariation_10;
			half _MotionAmplitude_20;
			half _EmissiveFlagMode;
			half _MessageOcclusion;
			half _MotionValue_20;
			half _MessageMainMask;
			half _MessageSecondMask;
			half _CategoryDetail;
			half _CategorySubsurface;
			half _CategoryEmissive;
			half _EmissiveIntensityValue;
			half _CategoryMotion;
			half _CategoryOcclusion;
			half _CategoryGradient;
			half _CategoryRender;
			half _CategoryMain;
			half _CategoryGlobals;
			half _MessageSubsurface;
			half _CategoryObject;
			half _AlphaClipValue;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);
			TEXTURE2D(_BumpMap);
			SAMPLER(sampler_BumpMap);
			TEXTURE2D(TVE_NoiseTex);
			half TVE_NoiseTexTilling;
			half4 TVE_MotionParams;
			half4 TVE_TimeParams;
			SAMPLER(sampler_Linear_Repeat);
			half4 TVE_WindEditor;
			half TVE_MotionValue_10;
			half TVE_MotionValue_20;
			half TVE_MotionValue_30;
			TEXTURE2D(_MainAlbedoTex);
			SAMPLER(sampler_MainAlbedoTex);
			TEXTURE2D(_MainMaskTex);
			TEXTURE2D(_SecondAlbedoTex);
			SAMPLER(sampler_SecondAlbedoTex);
			TEXTURE2D(_SecondMaskTex);
			TEXTURE2D(_MainNormalTex);
			half4 TVE_OverlayColor;
			half TVE_OverlayValue;
			TEXTURE2D(_SecondNormalTex);
			half TVE_SubsurfaceValue;
			half TVE_OverlaySubsurface;
			half3 TVE_MainLightDirection;
			TEXTURE2D(_EmissiveTex);


			
			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float3 VertexPosition3588_g80308 = v.positionOS.xyz;
				half3 Mesh_PivotsOS7730_g80308 = half3(0,0,0);
				float3 temp_output_7738_0_g80308 = ( VertexPosition3588_g80308 - Mesh_PivotsOS7730_g80308 );
				half3 VertexPos40_g80332 = temp_output_7738_0_g80308;
				half3 VertexPos40_g80333 = VertexPos40_g80332;
				float3 appendResult74_g80333 = (float3(VertexPos40_g80333.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g80333 = appendResult74_g80333;
				float3 break84_g80333 = VertexPos40_g80333;
				float3 appendResult81_g80333 = (float3(0.0 , break84_g80333.y , break84_g80333.z));
				half3 VertexPosOtherAxis82_g80333 = appendResult81_g80333;
				float3 ase_worldPos = TransformObjectToWorld( (v.positionOS).xyz );
				float3 vertexToFrag3890_g80308 = ase_worldPos;
				float3 WorldPosition3905_g80308 = vertexToFrag3890_g80308;
				float4x4 break19_g80338 = GetObjectToWorldMatrix();
				float3 appendResult20_g80338 = (float3(break19_g80338[ 0 ][ 3 ] , break19_g80338[ 1 ][ 3 ] , break19_g80338[ 2 ][ 3 ]));
				half3 ObjectData20_g80340 = appendResult20_g80338;
				half3 WorldData19_g80340 = ase_worldPos;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g80340 = WorldData19_g80340;
				#else
				float3 staticSwitch14_g80340 = ObjectData20_g80340;
				#endif
				float3 temp_output_114_0_g80338 = staticSwitch14_g80340;
				float3 vertexToFrag4224_g80308 = temp_output_114_0_g80338;
				float3 ObjectPosition4223_g80308 = vertexToFrag4224_g80308;
				float3 lerpResult7746_g80308 = lerp( WorldPosition3905_g80308 , ObjectPosition4223_g80308 , _MotionPosition_10);
				float3 Motion_10_Position7745_g80308 = lerpResult7746_g80308;
				half3 Input_Position419_g80317 = Motion_10_Position7745_g80308;
				float Input_MotionScale287_g80317 = ( _MotionScale_10 + 0.2 );
				half NoiseTex_Tilling735_g80317 = TVE_NoiseTexTilling;
				float2 temp_output_597_0_g80317 = (( Input_Position419_g80317 * Input_MotionScale287_g80317 * NoiseTex_Tilling735_g80317 * 0.0075 )).xz;
				float2 temp_output_447_0_g80373 = ((TVE_MotionParams).xy*2.0 + -1.0);
				half2 Global_Wind_DirectionWS4683_g80308 = temp_output_447_0_g80373;
				half2 Input_DirectionWS423_g80317 = Global_Wind_DirectionWS4683_g80308;
				float lerpResult128_g80318 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g80317 = _MotionSpeed_10;
				half Input_MotionVariation284_g80317 = _MotionVariation_10;
				half3 Input_Position167_g80354 = ObjectPosition4223_g80308;
				float dotResult156_g80354 = dot( (Input_Position167_g80354).xz , float2( 12.9898,78.233 ) );
				half Input_DynamicMode120_g80354 = 0.0;
				float Postion_Random162_g80354 = ( sin( dotResult156_g80354 ) * ( 1.0 - Input_DynamicMode120_g80354 ) );
				float4 break33_g80386 = _motion_variation_mode;
				float temp_output_30_0_g80386 = ( v.ase_color.r * break33_g80386.x );
				float temp_output_29_0_g80386 = ( v.ase_color.g * break33_g80386.y );
				float temp_output_31_0_g80386 = ( v.ase_color.b * break33_g80386.z );
				float lerpResult7828_g80308 = lerp( 0.0 , ( temp_output_30_0_g80386 + temp_output_29_0_g80386 + temp_output_31_0_g80386 + ( v.ase_color.a * break33_g80386.w ) ) , saturate( _MotionVariationMode ));
				float Mesh_Variation16_g80308 = lerpResult7828_g80308;
				half Input_Variation124_g80354 = Mesh_Variation16_g80308;
				half ObjectData20_g80356 = frac( ( Postion_Random162_g80354 + Input_Variation124_g80354 ) );
				half WorldData19_g80356 = Input_Variation124_g80354;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g80356 = WorldData19_g80356;
				#else
				float staticSwitch14_g80356 = ObjectData20_g80356;
				#endif
				float temp_output_112_0_g80354 = staticSwitch14_g80356;
				float clampResult171_g80354 = clamp( temp_output_112_0_g80354 , 0.01 , 0.99 );
				float Global_MeshVariation7760_g80308 = clampResult171_g80354;
				half Input_GlobalMeshVariation569_g80317 = Global_MeshVariation7760_g80308;
				float temp_output_630_0_g80317 = ( ( ( lerpResult128_g80318 * Input_MotionSpeed62_g80317 ) + ( Input_MotionVariation284_g80317 * Input_GlobalMeshVariation569_g80317 ) ) * 0.03 );
				float temp_output_607_0_g80317 = frac( temp_output_630_0_g80317 );
				float4 lerpResult590_g80317 = lerp( SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g80317 + ( -Input_DirectionWS423_g80317 * temp_output_607_0_g80317 ) ), 0.0 ) , SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g80317 + ( -Input_DirectionWS423_g80317 * frac( ( temp_output_630_0_g80317 + 0.5 ) ) ) ), 0.0 ) , ( abs( ( temp_output_607_0_g80317 - 0.5 ) ) / 0.5 ));
				half4 Noise_Complex703_g80317 = lerpResult590_g80317;
				float2 temp_output_645_0_g80317 = ((Noise_Complex703_g80317).rg*2.0 + -1.0);
				float2 break650_g80317 = temp_output_645_0_g80317;
				float3 appendResult649_g80317 = (float3(break650_g80317.x , 0.0 , break650_g80317.y));
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				half2 Global_Noise_OS5548_g80308 = (( mul( GetWorldToObjectMatrix(), float4( appendResult649_g80317 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_Noise_DirectionOS487_g80347 = Global_Noise_OS5548_g80308;
				float2 break448_g80373 = temp_output_447_0_g80373;
				float3 appendResult452_g80373 = (float3(break448_g80373.x , 0.0 , break448_g80373.y));
				half2 Global_Wind_DirectionOS5692_g80308 = (( mul( GetWorldToObjectMatrix(), float4( appendResult452_g80373 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_Wind_DirectionOS458_g80347 = Global_Wind_DirectionOS5692_g80308;
				float4 break322_g80373 = TVE_MotionParams;
				float lerpResult457_g80373 = lerp( break322_g80373.z , TVE_WindEditor.z , TVE_WindEditor.w);
				float temp_output_459_0_g80373 = ( 1.0 - lerpResult457_g80373 );
				half Global_Wind_Power2223_g80308 = ( 1.0 - ( temp_output_459_0_g80373 * temp_output_459_0_g80373 ) );
				half Input_WindPower449_g80347 = Global_Wind_Power2223_g80308;
				float2 lerpResult516_g80347 = lerp( Input_Noise_DirectionOS487_g80347 , Input_Wind_DirectionOS458_g80347 , ( Input_WindPower449_g80347 * 0.6 ));
				half Mesh_Height1524_g80308 = saturate( ( v.positionOS.xyz.y / _BoundsHeightValue ) );
				half Input_MeshHeight388_g80347 = Mesh_Height1524_g80308;
				half ObjectData20_g80348 = Input_MeshHeight388_g80347;
				half Input_BoundsHeight390_g80347 = 1.0;
				half WorldData19_g80348 = ( Input_MeshHeight388_g80347 * Input_MeshHeight388_g80347 * Input_BoundsHeight390_g80347 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g80348 = WorldData19_g80348;
				#else
				float staticSwitch14_g80348 = ObjectData20_g80348;
				#endif
				half Final_Motion10_Mask321_g80347 = ( staticSwitch14_g80348 * 2.0 );
				half Input_BendingAmplitude376_g80347 = _MotionAmplitude_10;
				half Global_MotionValue640_g80347 = TVE_MotionValue_10;
				half2 Final_Bending631_g80347 = ( lerpResult516_g80347 * ( Final_Motion10_Mask321_g80347 * Input_BendingAmplitude376_g80347 * Input_WindPower449_g80347 * Input_WindPower449_g80347 * Global_MotionValue640_g80347 ) );
				float2 break636_g80347 = Final_Bending631_g80347;
				float3 appendResult637_g80347 = (float3(break636_g80347.x , 0.0 , break636_g80347.y));
				half3 Motion_10_Bending216_g80308 = appendResult637_g80347;
				half3 Angle44_g80332 = Motion_10_Bending216_g80308;
				half Angle44_g80333 = (Angle44_g80332).z;
				half3 VertexPos40_g80334 = ( VertexPosRotationAxis50_g80333 + ( VertexPosOtherAxis82_g80333 * cos( Angle44_g80333 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g80333 ) * sin( Angle44_g80333 ) ) );
				float3 appendResult74_g80334 = (float3(0.0 , 0.0 , VertexPos40_g80334.z));
				half3 VertexPosRotationAxis50_g80334 = appendResult74_g80334;
				float3 break84_g80334 = VertexPos40_g80334;
				float3 appendResult81_g80334 = (float3(break84_g80334.x , break84_g80334.y , 0.0));
				half3 VertexPosOtherAxis82_g80334 = appendResult81_g80334;
				half Angle44_g80334 = -(Angle44_g80332).x;
				half3 Input_Position419_g80359 = WorldPosition3905_g80308;
				float3 break459_g80359 = Input_Position419_g80359;
				float Sum_Position446_g80359 = ( break459_g80359.x + break459_g80359.y + break459_g80359.z );
				half Input_MotionScale321_g80359 = ( _MotionScale_20 * 0.1 );
				half Input_MotionVariation330_g80359 = _MotionVariation_20;
				half Input_GlobalVariation400_g80359 = Global_MeshVariation7760_g80308;
				float lerpResult128_g80360 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g80359 = _MotionSpeed_20;
				float temp_output_404_0_g80359 = ( lerpResult128_g80360 * Input_MotionSpeed62_g80359 );
				half Motion_SineA450_g80359 = sin( ( ( Sum_Position446_g80359 * Input_MotionScale321_g80359 ) + ( Input_MotionVariation330_g80359 * Input_GlobalVariation400_g80359 ) + temp_output_404_0_g80359 ) );
				half Motion_SineB395_g80359 = sin( ( ( temp_output_404_0_g80359 * 0.6842 ) + ( Sum_Position446_g80359 * Input_MotionScale321_g80359 ) ) );
				half3 Input_Position419_g80345 = VertexPosition3588_g80308;
				float3 normalizeResult518_g80345 = normalize( Input_Position419_g80345 );
				half2 Input_DirectionOS423_g80345 = Global_Wind_DirectionOS5692_g80308;
				float2 break521_g80345 = -Input_DirectionOS423_g80345;
				float3 appendResult522_g80345 = (float3(break521_g80345.x , 0.0 , break521_g80345.y));
				float dotResult519_g80345 = dot( normalizeResult518_g80345 , appendResult522_g80345 );
				half Input_Value62_g80345 = _MotionFacingValue;
				float lerpResult524_g80345 = lerp( 1.0 , (dotResult519_g80345*0.5 + 0.5) , Input_Value62_g80345);
				half ObjectData20_g80346 = max( lerpResult524_g80345 , 0.001 );
				half WorldData19_g80346 = 1.0;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g80346 = WorldData19_g80346;
				#else
				float staticSwitch14_g80346 = ObjectData20_g80346;
				#endif
				half Motion_FacingMask7691_g80308 = staticSwitch14_g80346;
				half Motion_20_Amplitude7628_g80308 = Motion_FacingMask7691_g80308;
				half Input_MotionAmplitude384_g80359 = Motion_20_Amplitude7628_g80308;
				half Input_GlobalWind407_g80359 = Global_Wind_Power2223_g80308;
				float4 break638_g80317 = abs( Noise_Complex703_g80317 );
				half Global_Noise_B5526_g80308 = break638_g80317.b;
				half Input_GlobalNoise411_g80359 = Global_Noise_B5526_g80308;
				float lerpResult413_g80359 = lerp( 1.8 , 0.4 , Input_GlobalWind407_g80359);
				half Motion_Amplitude418_g80359 = ( Input_MotionAmplitude384_g80359 * Input_GlobalWind407_g80359 * pow( Input_GlobalNoise411_g80359 , lerpResult413_g80359 ) );
				half Input_Squash58_g80359 = _MotionAmplitude_20;
				float3 appendResult7790_g80308 = (float3(0.0 , v.positionOS.xyz.y , 0.0));
				half Mesh_Spherical7697_g80308 = saturate( ( distance( v.positionOS.xyz , appendResult7790_g80308 ) / _BoundsRadiusValue ) );
				float4 break33_g80370 = _motion_mask_mode_20;
				float temp_output_30_0_g80370 = ( v.ase_color.r * break33_g80370.x );
				float temp_output_29_0_g80370 = ( v.ase_color.g * break33_g80370.y );
				float temp_output_31_0_g80370 = ( v.ase_color.b * break33_g80370.z );
				float lerpResult7813_g80308 = lerp( Mesh_Spherical7697_g80308 , ( temp_output_30_0_g80370 + temp_output_29_0_g80370 + temp_output_31_0_g80370 + ( v.ase_color.a * break33_g80370.w ) ) , saturate( _MotionMaskMode_20 ));
				half Mesh_Motion_207834_g80308 = lerpResult7813_g80308;
				half Input_MeshMotion_20388_g80359 = Mesh_Motion_207834_g80308;
				half Input_BoundsRadius390_g80359 = 1.0;
				half Global_MotionValue462_g80359 = TVE_MotionValue_20;
				half2 Input_DirectionOS366_g80359 = Global_Wind_DirectionOS5692_g80308;
				float2 break371_g80359 = Input_DirectionOS366_g80359;
				float3 appendResult372_g80359 = (float3(break371_g80359.x , ( Motion_SineA450_g80359 * 0.3 ) , break371_g80359.y));
				half3 Motion_20_Squash7632_g80308 = ( ( (max( Motion_SineA450_g80359 , Motion_SineB395_g80359 )*0.5 + 0.5) * Motion_Amplitude418_g80359 * Input_Squash58_g80359 * Input_MeshMotion_20388_g80359 * Input_BoundsRadius390_g80359 * Global_MotionValue462_g80359 ) * appendResult372_g80359 );
				half3 VertexPos40_g80321 = ( ( VertexPosRotationAxis50_g80334 + ( VertexPosOtherAxis82_g80334 * cos( Angle44_g80334 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g80334 ) * sin( Angle44_g80334 ) ) ) + Motion_20_Squash7632_g80308 );
				float3 appendResult74_g80321 = (float3(0.0 , VertexPos40_g80321.y , 0.0));
				float3 VertexPosRotationAxis50_g80321 = appendResult74_g80321;
				float3 break84_g80321 = VertexPos40_g80321;
				float3 appendResult81_g80321 = (float3(break84_g80321.x , 0.0 , break84_g80321.z));
				float3 VertexPosOtherAxis82_g80321 = appendResult81_g80321;
				half Input_Rolling379_g80359 = _MotionAmplitude_22;
				half Motion_20_Rolling7633_g80308 = ( Motion_SineA450_g80359 * Motion_Amplitude418_g80359 * Input_Rolling379_g80359 * Input_MeshMotion_20388_g80359 * Global_MotionValue462_g80359 );
				half Angle44_g80321 = Motion_20_Rolling7633_g80308;
				half3 Input_Position500_g80326 = WorldPosition3905_g80308;
				half Input_MotionScale321_g80326 = _MotionScale_32;
				half Input_MotionVariation330_g80326 = _MotionVariation_32;
				half Input_GlobalVariation372_g80326 = Global_MeshVariation7760_g80308;
				float lerpResult128_g80327 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g80326 = _MotionSpeed_32;
				float4 tex2DNode460_g80326 = SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( ( (Input_Position500_g80326).xz * Input_MotionScale321_g80326 * 0.03 ) + ( Input_MotionVariation330_g80326 * Input_GlobalVariation372_g80326 ) + ( lerpResult128_g80327 * Input_MotionSpeed62_g80326 * 0.02 ) ), 0.0 );
				float3 appendResult462_g80326 = (float3(tex2DNode460_g80326.r , tex2DNode460_g80326.g , tex2DNode460_g80326.b));
				half3 Flutter_Texture489_g80326 = (appendResult462_g80326*2.0 + -1.0);
				half Motion_30_Amplitude7534_g80308 = ( _MotionAmplitude_32 * Motion_FacingMask7691_g80308 );
				half Input_MotionAmplitude58_g80326 = Motion_30_Amplitude7534_g80308;
				float4 break33_g80369 = _motion_mask_mode_30;
				float temp_output_30_0_g80369 = ( v.ase_color.r * break33_g80369.x );
				float temp_output_29_0_g80369 = ( v.ase_color.g * break33_g80369.y );
				float temp_output_31_0_g80369 = ( v.ase_color.b * break33_g80369.z );
				float lerpResult7820_g80308 = lerp( v.texcoord0.y , ( temp_output_30_0_g80369 + temp_output_29_0_g80369 + temp_output_31_0_g80369 + ( v.ase_color.a * break33_g80369.w ) ) , saturate( _MotionMaskMode_30 ));
				half Mesh_Motion_30144_g80308 = lerpResult7820_g80308;
				half Input_MeshMotion_30374_g80326 = Mesh_Motion_30144_g80308;
				half Input_GlobalWind471_g80326 = Global_Wind_Power2223_g80308;
				half Global_MotionValue503_g80326 = TVE_MotionValue_30;
				half Input_GlobalNoise472_g80326 = Global_Noise_B5526_g80308;
				float lerpResult466_g80326 = lerp( 2.4 , 0.6 , Input_GlobalWind471_g80326);
				half Flutter_Amplitude491_g80326 = ( Input_MotionAmplitude58_g80326 * Input_MeshMotion_30374_g80326 * Input_GlobalWind471_g80326 * Global_MotionValue503_g80326 * pow( Input_GlobalNoise472_g80326 , lerpResult466_g80326 ) );
				half3 Motion_30_Flutter263_g80308 = ( Flutter_Texture489_g80326 * Flutter_Amplitude491_g80326 );
				float3 Vertex_Motion_Object7655_g80308 = ( ( ( VertexPosRotationAxis50_g80321 + ( VertexPosOtherAxis82_g80321 * cos( Angle44_g80321 ) ) + ( cross( float3(0,1,0) , VertexPosOtherAxis82_g80321 ) * sin( Angle44_g80321 ) ) ) + Motion_30_Flutter263_g80308 ) + Mesh_PivotsOS7730_g80308 );
				float3 Final_VertexPosition890_g80308 = Vertex_Motion_Object7655_g80308;
				
				float4 break33_g80365 = _second_uvs_mode;
				float2 temp_output_30_0_g80365 = ( v.texcoord0.xy * break33_g80365.x );
				float2 temp_output_29_0_g80365 = ( v.ase_texcoord3.xy * break33_g80365.y );
				float2 temp_output_31_0_g80365 = ( (WorldPosition3905_g80308).xz * break33_g80365.z );
				half2 Second_UVs_Tilling7781_g80308 = (_SecondUVs).xy;
				half2 Second_UVs_Scale7782_g80308 = ( 1.0 / Second_UVs_Tilling7781_g80308 );
				float2 lerpResult7786_g80308 = lerp( Second_UVs_Tilling7781_g80308 , Second_UVs_Scale7782_g80308 , _SecondUVsScaleMode);
				half2 Second_UVs_Offset7777_g80308 = (_SecondUVs).zw;
				float2 vertexToFrag11_g80309 = ( ( ( temp_output_30_0_g80365 + temp_output_29_0_g80365 + temp_output_31_0_g80365 ) * lerpResult7786_g80308 ) + Second_UVs_Offset7777_g80308 );
				o.ase_texcoord4.zw = vertexToFrag11_g80309;
				float3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				o.ase_texcoord5.xyz = ase_worldTangent;
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				o.ase_texcoord6.xyz = ase_worldNormal;
				float ase_vertexTangentSign = v.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord7.xyz = ase_worldBitangent;
				
				o.ase_texcoord4.xy = v.texcoord0.xy;
				o.ase_color = v.ase_color;
				o.ase_texcoord8 = v.positionOS;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord5.w = 0;
				o.ase_texcoord6.w = 0;
				o.ase_texcoord7.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = Final_VertexPosition890_g80308;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.positionOS.xyz = vertexValue;
				#else
					v.positionOS.xyz += vertexValue;
				#endif

				v.normalOS = v.normalOS;

				float3 positionWS = TransformObjectToWorld( v.positionOS.xyz );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					o.positionWS = positionWS;
				#endif

				o.positionCS = MetaVertexPosition( v.positionOS, v.texcoord1.xy, v.texcoord1.xy, unity_LightmapST, unity_DynamicLightmapST );

				#ifdef EDITOR_VISUALIZATION
					float2 VizUV = 0;
					float4 LightCoord = 0;
					UnityEditorVizData(v.positionOS.xyz, v.texcoord0.xy, v.texcoord1.xy, v.texcoord2.xy, VizUV, LightCoord);
					o.VizUV = float4(VizUV, 0, 0);
					o.LightCoord = LightCoord;
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = o.positionCS;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 texcoord0 : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_color : COLOR;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_tangent : TANGENT;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.positionOS;
				o.normalOS = v.normalOS;
				o.texcoord0 = v.texcoord0;
				o.texcoord1 = v.texcoord1;
				o.texcoord2 = v.texcoord2;
				o.ase_color = v.ase_color;
				o.ase_texcoord3 = v.ase_texcoord3;
				o.ase_tangent = v.ase_tangent;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.positionOS = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.texcoord0 = patch[0].texcoord0 * bary.x + patch[1].texcoord0 * bary.y + patch[2].texcoord0 * bary.z;
				o.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
				o.texcoord2 = patch[0].texcoord2 * bary.x + patch[1].texcoord2 * bary.y + patch[2].texcoord2 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].vertex.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(VertexOutput IN  ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 WorldPosition = IN.positionWS;
				#endif

				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				half2 Main_UVs15_g80308 = ( ( IN.ase_texcoord4.xy * (_MainUVs).xy ) + (_MainUVs).zw );
				float4 tex2DNode29_g80308 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs15_g80308 );
				float3 lerpResult6223_g80308 = lerp( float3( 1,1,1 ) , (tex2DNode29_g80308).rgb , _MainAlbedoValue);
				float4 tex2DNode35_g80308 = SAMPLE_TEXTURE2D( _MainMaskTex, sampler_Linear_Repeat, Main_UVs15_g80308 );
				half Main_Mask57_g80308 = tex2DNode35_g80308.b;
				float clampResult17_g80376 = clamp( Main_Mask57_g80308 , 0.0001 , 0.9999 );
				float temp_output_7_0_g80377 = _MainMaskMinValue;
				float temp_output_10_0_g80377 = ( _MainMaskMaxValue - temp_output_7_0_g80377 );
				half Main_Mask_Remap5765_g80308 = saturate( ( ( clampResult17_g80376 - temp_output_7_0_g80377 ) / ( temp_output_10_0_g80377 + 0.0001 ) ) );
				float lerpResult7896_g80308 = lerp( 1.0 , Main_Mask_Remap5765_g80308 , _MainColorMode);
				float4 lerpResult7876_g80308 = lerp( _MainColorTwo , _MainColor , lerpResult7896_g80308);
				half3 Main_Color_RGB7884_g80308 = (lerpResult7876_g80308).rgb;
				half3 Main_Albedo99_g80308 = ( lerpResult6223_g80308 * Main_Color_RGB7884_g80308 );
				float2 vertexToFrag11_g80309 = IN.ase_texcoord4.zw;
				half2 Second_UVs17_g80308 = vertexToFrag11_g80309;
				float4 tex2DNode89_g80308 = SAMPLE_TEXTURE2D( _SecondAlbedoTex, sampler_SecondAlbedoTex, Second_UVs17_g80308 );
				float3 lerpResult6225_g80308 = lerp( float3( 1,1,1 ) , (tex2DNode89_g80308).rgb , _SecondAlbedoValue);
				float4 tex2DNode33_g80308 = SAMPLE_TEXTURE2D( _SecondMaskTex, sampler_Linear_Repeat, Second_UVs17_g80308 );
				half Second_Mask81_g80308 = tex2DNode33_g80308.b;
				float clampResult17_g80378 = clamp( Second_Mask81_g80308 , 0.0001 , 0.9999 );
				float temp_output_7_0_g80379 = _SecondMaskMinValue;
				float temp_output_10_0_g80379 = ( _SecondMaskMaxValue - temp_output_7_0_g80379 );
				half Second_Mask_Remap6130_g80308 = saturate( ( ( clampResult17_g80378 - temp_output_7_0_g80379 ) / ( temp_output_10_0_g80379 + 0.0001 ) ) );
				float lerpResult7897_g80308 = lerp( 1.0 , Second_Mask_Remap6130_g80308 , _SecondColorMode);
				float4 lerpResult7886_g80308 = lerp( _SecondColorTwo , _SecondColor , lerpResult7897_g80308);
				half3 Second_Color_RGB7894_g80308 = (lerpResult7886_g80308).rgb;
				half3 Second_Albedo153_g80308 = ( lerpResult6225_g80308 * Second_Color_RGB7894_g80308 );
				#ifdef UNITY_COLORSPACE_GAMMA
				float staticSwitch1_g80311 = 2.0;
				#else
				float staticSwitch1_g80311 = 4.594794;
				#endif
				float3 lerpResult4834_g80308 = lerp( ( Main_Albedo99_g80308 * Second_Albedo153_g80308 * staticSwitch1_g80311 ) , Second_Albedo153_g80308 , _DetailBlendMode);
				float lerpResult6885_g80308 = lerp( Main_Mask57_g80308 , Second_Mask81_g80308 , _DetailMaskMode);
				float clampResult17_g80325 = clamp( lerpResult6885_g80308 , 0.0001 , 0.9999 );
				float temp_output_7_0_g80324 = _DetailMaskMinValue;
				float temp_output_10_0_g80324 = ( _DetailMaskMaxValue - temp_output_7_0_g80324 );
				half Blend_Mask_Texture6794_g80308 = saturate( ( ( clampResult17_g80325 - temp_output_7_0_g80324 ) / ( temp_output_10_0_g80324 + 0.0001 ) ) );
				half4 Normal_Packed45_g80375 = SAMPLE_TEXTURE2D( _MainNormalTex, sampler_Linear_Repeat, Main_UVs15_g80308 );
				float2 appendResult58_g80375 = (float2(( (Normal_Packed45_g80375).x * (Normal_Packed45_g80375).w ) , (Normal_Packed45_g80375).y));
				half2 Normal_Default50_g80375 = appendResult58_g80375;
				half2 Normal_ASTC41_g80375 = (Normal_Packed45_g80375).xy;
				#ifdef UNITY_ASTC_NORMALMAP_ENCODING
				float2 staticSwitch38_g80375 = Normal_ASTC41_g80375;
				#else
				float2 staticSwitch38_g80375 = Normal_Default50_g80375;
				#endif
				half2 Normal_NO_DTX544_g80375 = (Normal_Packed45_g80375).wy;
				#ifdef UNITY_NO_DXT5nm
				float2 staticSwitch37_g80375 = Normal_NO_DTX544_g80375;
				#else
				float2 staticSwitch37_g80375 = staticSwitch38_g80375;
				#endif
				float2 temp_output_6555_0_g80308 = ( (staticSwitch37_g80375*2.0 + -1.0) * _MainNormalValue );
				float3 appendResult7388_g80308 = (float3(temp_output_6555_0_g80308 , 1.0));
				float3 ase_worldTangent = IN.ase_texcoord5.xyz;
				float3 ase_worldNormal = IN.ase_texcoord6.xyz;
				float3 ase_worldBitangent = IN.ase_texcoord7.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 tanNormal7389_g80308 = appendResult7388_g80308;
				float3 worldNormal7389_g80308 = float3(dot(tanToWorld0,tanNormal7389_g80308), dot(tanToWorld1,tanNormal7389_g80308), dot(tanToWorld2,tanNormal7389_g80308));
				half3 Main_NormalWS7390_g80308 = worldNormal7389_g80308;
				float4 break33_g80385 = _detail_mesh_mode;
				float temp_output_30_0_g80385 = ( IN.ase_color.r * break33_g80385.x );
				float temp_output_29_0_g80385 = ( IN.ase_color.g * break33_g80385.y );
				float temp_output_31_0_g80385 = ( IN.ase_color.b * break33_g80385.z );
				float lerpResult7836_g80308 = lerp( ((Main_NormalWS7390_g80308).y*0.5 + 0.5) , ( temp_output_30_0_g80385 + temp_output_29_0_g80385 + temp_output_31_0_g80385 + ( IN.ase_color.a * break33_g80385.w ) ) , saturate( _DetailMeshMode ));
				float clampResult17_g80323 = clamp( lerpResult7836_g80308 , 0.0001 , 0.9999 );
				float temp_output_7_0_g80322 = _DetailMeshMinValue;
				float temp_output_10_0_g80322 = ( _DetailMeshMaxValue - temp_output_7_0_g80322 );
				half Blend_Mask_Mesh1540_g80308 = saturate( ( ( clampResult17_g80323 - temp_output_7_0_g80322 ) / ( temp_output_10_0_g80322 + 0.0001 ) ) );
				float clampResult17_g80352 = clamp( ( Blend_Mask_Texture6794_g80308 * Blend_Mask_Mesh1540_g80308 ) , 0.0001 , 0.9999 );
				float temp_output_7_0_g80353 = _DetailBlendMinValue;
				float temp_output_10_0_g80353 = ( _DetailBlendMaxValue - temp_output_7_0_g80353 );
				half Blend_Mask147_g80308 = ( saturate( ( ( clampResult17_g80352 - temp_output_7_0_g80353 ) / ( temp_output_10_0_g80353 + 0.0001 ) ) ) * _DetailMode * _DetailValue );
				float3 lerpResult235_g80308 = lerp( Main_Albedo99_g80308 , lerpResult4834_g80308 , Blend_Mask147_g80308);
				#ifdef TVE_FEATURE_DETAIL
				float3 staticSwitch255_g80308 = lerpResult235_g80308;
				#else
				float3 staticSwitch255_g80308 = Main_Albedo99_g80308;
				#endif
				half3 Blend_Albedo265_g80308 = staticSwitch255_g80308;
				half Mesh_Height1524_g80308 = saturate( ( IN.ase_texcoord8.xyz.y / _BoundsHeightValue ) );
				float temp_output_7_0_g80367 = _GradientMinValue;
				float temp_output_10_0_g80367 = ( _GradientMaxValue - temp_output_7_0_g80367 );
				half Gradient_Value2784_g80308 = saturate( ( ( Mesh_Height1524_g80308 - temp_output_7_0_g80367 ) / ( temp_output_10_0_g80367 + 0.0001 ) ) );
				float3 lerpResult2779_g80308 = lerp( (_GradientColorTwo).rgb , (_GradientColorOne).rgb , Gradient_Value2784_g80308);
				float lerpResult6617_g80308 = lerp( Main_Mask_Remap5765_g80308 , Second_Mask_Remap6130_g80308 , Blend_Mask147_g80308);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch6623_g80308 = lerpResult6617_g80308;
				#else
				float staticSwitch6623_g80308 = Main_Mask_Remap5765_g80308;
				#endif
				half Blend_Mask_Remap6621_g80308 = staticSwitch6623_g80308;
				half Gradient_Mask6207_g80308 = Blend_Mask_Remap6621_g80308;
				float3 lerpResult6208_g80308 = lerp( float3( 1,1,1 ) , lerpResult2779_g80308 , Gradient_Mask6207_g80308);
				half3 Tint_Gradient_Color5769_g80308 = lerpResult6208_g80308;
				float3 appendResult7790_g80308 = (float3(0.0 , IN.ase_texcoord8.xyz.y , 0.0));
				half Mesh_Spherical7697_g80308 = saturate( ( distance( IN.ase_texcoord8.xyz , appendResult7790_g80308 ) / _BoundsRadiusValue ) );
				float4 break33_g80384 = _vertex_occlusion_mask_mode;
				float temp_output_30_0_g80384 = ( IN.ase_color.r * break33_g80384.x );
				float temp_output_29_0_g80384 = ( IN.ase_color.g * break33_g80384.y );
				float temp_output_31_0_g80384 = ( IN.ase_color.b * break33_g80384.z );
				float lerpResult7809_g80308 = lerp( Mesh_Spherical7697_g80308 , ( temp_output_30_0_g80384 + temp_output_29_0_g80384 + temp_output_31_0_g80384 + ( IN.ase_color.a * break33_g80384.w ) ) , saturate( _VertexOcclusionMaskMode ));
				float clampResult17_g80371 = clamp( lerpResult7809_g80308 , 0.0001 , 0.9999 );
				float temp_output_7_0_g80366 = _VertexOcclusionMinValue;
				float temp_output_10_0_g80366 = ( _VertexOcclusionMaxValue - temp_output_7_0_g80366 );
				half Occlusion_Mask6432_g80308 = saturate( ( ( clampResult17_g80371 - temp_output_7_0_g80366 ) / ( temp_output_10_0_g80366 + 0.0001 ) ) );
				float3 lerpResult2945_g80308 = lerp( (_VertexOcclusionColor).rgb , float3( 1,1,1 ) , Occlusion_Mask6432_g80308);
				half3 Occlusion_Color648_g80308 = lerpResult2945_g80308;
				half3 Blend_Albedo_Tinted2808_g80308 = ( Blend_Albedo265_g80308 * Tint_Gradient_Color5769_g80308 * Occlusion_Color648_g80308 );
				half3 Global_OverlayColor1758_g80308 = (TVE_OverlayColor).rgb;
				half Global_OverlayIntensity154_g80308 = TVE_OverlayValue;
				half Overlay_Value5738_g80308 = ( _GlobalOverlay * Global_OverlayIntensity154_g80308 );
				half2 Main_Normal137_g80308 = temp_output_6555_0_g80308;
				float2 lerpResult3372_g80308 = lerp( float2( 0,0 ) , Main_Normal137_g80308 , _DetailNormalValue);
				float3x3 ase_worldToTangent = float3x3(ase_worldTangent,ase_worldBitangent,ase_worldNormal);
				half4 Normal_Packed45_g80380 = SAMPLE_TEXTURE2D( _SecondNormalTex, sampler_Linear_Repeat, Second_UVs17_g80308 );
				float2 appendResult58_g80380 = (float2(( (Normal_Packed45_g80380).x * (Normal_Packed45_g80380).w ) , (Normal_Packed45_g80380).y));
				half2 Normal_Default50_g80380 = appendResult58_g80380;
				half2 Normal_ASTC41_g80380 = (Normal_Packed45_g80380).xy;
				#ifdef UNITY_ASTC_NORMALMAP_ENCODING
				float2 staticSwitch38_g80380 = Normal_ASTC41_g80380;
				#else
				float2 staticSwitch38_g80380 = Normal_Default50_g80380;
				#endif
				half2 Normal_NO_DTX544_g80380 = (Normal_Packed45_g80380).wy;
				#ifdef UNITY_NO_DXT5nm
				float2 staticSwitch37_g80380 = Normal_NO_DTX544_g80380;
				#else
				float2 staticSwitch37_g80380 = staticSwitch38_g80380;
				#endif
				float2 temp_output_6560_0_g80308 = ( (staticSwitch37_g80380*2.0 + -1.0) * _SecondNormalValue );
				half2 Normal_Planar45_g80381 = temp_output_6560_0_g80308;
				float2 break64_g80381 = Normal_Planar45_g80381;
				float3 appendResult65_g80381 = (float3(break64_g80381.x , 0.0 , break64_g80381.y));
				float2 temp_output_7775_0_g80308 = (mul( ase_worldToTangent, appendResult65_g80381 )).xy;
				float2 ifLocalVar7776_g80308 = 0;
				if( _SecondUVsMode >= 2.0 )
				ifLocalVar7776_g80308 = temp_output_7775_0_g80308;
				else
				ifLocalVar7776_g80308 = temp_output_6560_0_g80308;
				half2 Second_Normal179_g80308 = ifLocalVar7776_g80308;
				float2 temp_output_36_0_g80312 = ( lerpResult3372_g80308 + Second_Normal179_g80308 );
				float2 lerpResult3376_g80308 = lerp( Main_Normal137_g80308 , temp_output_36_0_g80312 , Blend_Mask147_g80308);
				#ifdef TVE_FEATURE_DETAIL
				float2 staticSwitch267_g80308 = lerpResult3376_g80308;
				#else
				float2 staticSwitch267_g80308 = Main_Normal137_g80308;
				#endif
				half2 Blend_Normal312_g80308 = staticSwitch267_g80308;
				float3 appendResult7377_g80308 = (float3(Blend_Normal312_g80308 , 1.0));
				float3 tanNormal7376_g80308 = appendResult7377_g80308;
				float3 worldNormal7376_g80308 = float3(dot(tanToWorld0,tanNormal7376_g80308), dot(tanToWorld1,tanNormal7376_g80308), dot(tanToWorld2,tanNormal7376_g80308));
				half3 Blend_NormalWS7375_g80308 = worldNormal7376_g80308;
				float lerpResult7510_g80308 = lerp( 1.0 , saturate( (Blend_NormalWS7375_g80308).y ) , _OverlayProjectionValue);
				half Overlay_Projection6081_g80308 = lerpResult7510_g80308;
				float3 temp_output_3_0_g80316 = ( Blend_Albedo265_g80308 * Tint_Gradient_Color5769_g80308 );
				float dotResult20_g80316 = dot( temp_output_3_0_g80316 , float3(0.2126,0.7152,0.0722) );
				float clampResult6740_g80308 = clamp( saturate( ( dotResult20_g80316 * 5.0 ) ) , 0.2 , 1.0 );
				half Blend_Albedo_Globals6410_g80308 = clampResult6740_g80308;
				half Overlay_Shading6688_g80308 = Blend_Albedo_Globals6410_g80308;
				half Occlusion_Alpha6463_g80308 = _VertexOcclusionColor.a;
				float lerpResult7923_g80308 = lerp( Occlusion_Mask6432_g80308 , ( 1.0 - Occlusion_Mask6432_g80308 ) , _VertexOcclusionOverlayMode);
				float lerpResult7921_g80308 = lerp( Occlusion_Alpha6463_g80308 , 1.0 , lerpResult7923_g80308);
				half Occlusion_Overlay6471_g80308 = lerpResult7921_g80308;
				half Overlay_Variation4560_g80308 = 1.0;
				float temp_output_7_0_g80313 = 0.1;
				float temp_output_10_0_g80313 = ( 0.2 - temp_output_7_0_g80313 );
				half Overlay_Mask269_g80308 = saturate( ( ( ( Overlay_Value5738_g80308 * Overlay_Projection6081_g80308 * Overlay_Shading6688_g80308 * Occlusion_Overlay6471_g80308 * Overlay_Variation4560_g80308 ) - temp_output_7_0_g80313 ) / ( temp_output_10_0_g80313 + 0.0001 ) ) );
				float3 lerpResult336_g80308 = lerp( Blend_Albedo_Tinted2808_g80308 , Global_OverlayColor1758_g80308 , Overlay_Mask269_g80308);
				half3 Blend_Albedo_Overlay359_g80308 = lerpResult336_g80308;
				half3 Subsurface_Color1722_g80308 = ( (_SubsurfaceColor).rgb * Blend_Albedo_Overlay359_g80308 );
				half Global_Subsurface7580_g80308 = TVE_SubsurfaceValue;
				half Global_OverlaySubsurface5667_g80308 = TVE_OverlaySubsurface;
				float lerpResult7362_g80308 = lerp( 1.0 , Global_OverlaySubsurface5667_g80308 , Occlusion_Mask6432_g80308);
				half Overlay_Subsurface7361_g80308 = lerpResult7362_g80308;
				half Subsurface_Intensity1752_g80308 = ( _SubsurfaceValue * Global_Subsurface7580_g80308 * Overlay_Subsurface7361_g80308 );
				float lerpResult7903_g80308 = lerp( 1.0 , Blend_Mask_Remap6621_g80308 , _SubsurfaceMaskValue);
				half Subsurface_Mask1557_g80308 = lerpResult7903_g80308;
				half3 MainLight_Direction7581_g80308 = TVE_MainLightDirection;
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 normalizeResult7596_g80308 = normalize( ase_worldViewDir );
				float3 ViewDirection7598_g80308 = normalizeResult7596_g80308;
				float dotResult7591_g80308 = dot( -MainLight_Direction7581_g80308 , ViewDirection7598_g80308 );
				float saferPower7590_g80308 = abs( saturate( dotResult7591_g80308 ) );
				#ifdef UNITY_PASS_FORWARDADD
				float staticSwitch7595_g80308 = 0.0;
				#else
				float staticSwitch7595_g80308 = ( pow( saferPower7590_g80308 , _SubsurfaceAngleValue ) * _SubsurfaceScatteringValue );
				#endif
				half Mask_Subsurface_View7587_g80308 = staticSwitch7595_g80308;
				half3 Subsurface_Approximation7607_g80308 = ( Subsurface_Color1722_g80308 * Subsurface_Intensity1752_g80308 * Subsurface_Mask1557_g80308 * Mask_Subsurface_View7587_g80308 );
				half3 Blend_Albedo_Subsurface7608_g80308 = ( Blend_Albedo_Overlay359_g80308 + Subsurface_Approximation7607_g80308 );
				
				float3 temp_cast_2 = (0.0).xxx;
				half3 Emissive_Color7162_g80308 = (_EmissiveColor).rgb;
				half2 Emissive_UVs2468_g80308 = ( ( IN.ase_texcoord4.xy * (_EmissiveUVs).xy ) + (_EmissiveUVs).zw );
				float temp_output_7_0_g80383 = _EmissiveTexMinValue;
				float3 temp_cast_3 = (temp_output_7_0_g80383).xxx;
				float temp_output_10_0_g80383 = ( _EmissiveTexMaxValue - temp_output_7_0_g80383 );
				half3 Emissive_Texture7022_g80308 = saturate( ( ( (SAMPLE_TEXTURE2D( _EmissiveTex, sampler_Linear_Repeat, Emissive_UVs2468_g80308 )).rgb - temp_cast_3 ) / ( temp_output_10_0_g80383 + 0.0001 ) ) );
				half3 Emissive_Mask6968_g80308 = Emissive_Texture7022_g80308;
				float3 temp_output_3_0_g80382 = ( Emissive_Color7162_g80308 * Emissive_Mask6968_g80308 );
				float temp_output_15_0_g80382 = _emissive_intensity_value;
				float3 temp_output_23_0_g80382 = ( temp_output_3_0_g80382 * temp_output_15_0_g80382 );
				#ifdef TVE_FEATURE_EMISSIVE
				float3 staticSwitch7912_g80308 = temp_output_23_0_g80382;
				#else
				float3 staticSwitch7912_g80308 = temp_cast_2;
				#endif
				half3 Final_Emissive2476_g80308 = staticSwitch7912_g80308;
				
				float localCustomAlphaClip19_g80314 = ( 0.0 );
				half Main_Alpha316_g80308 = tex2DNode29_g80308.a;
				half Second_Alpha5007_g80308 = tex2DNode89_g80308.a;
				float lerpResult6153_g80308 = lerp( Main_Alpha316_g80308 , Second_Alpha5007_g80308 , Blend_Mask147_g80308);
				float lerpResult6785_g80308 = lerp( ( Main_Alpha316_g80308 * Second_Alpha5007_g80308 ) , lerpResult6153_g80308 , _DetailAlphaMode);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch6158_g80308 = lerpResult6785_g80308;
				#else
				float staticSwitch6158_g80308 = Main_Alpha316_g80308;
				#endif
				half Blend_Alpha6157_g80308 = staticSwitch6158_g80308;
				half AlphaTreshold2132_g80308 = _AlphaClipValue;
				float temp_output_3_0_g80314 = ( Blend_Alpha6157_g80308 - AlphaTreshold2132_g80308 );
				float Alpha19_g80314 = temp_output_3_0_g80314;
				float temp_output_15_0_g80314 = 0.01;
				float Treshold19_g80314 = temp_output_15_0_g80314;
				{
				#if defined (TVE_FEATURE_CLIP)
				#if defined (TVE_IS_HD_PIPELINE)
				#if !defined(SHADERPASS_FORWARD_BYPASS_ALPHA_TEST) && !defined(SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST)
				clip(Alpha19_g80314 - Treshold19_g80314);
				#endif
				#else
				clip(Alpha19_g80314 - Treshold19_g80314);
				#endif
				#endif
				}
				half Final_Clip914_g80308 = Alpha19_g80314;
				

				float3 BaseColor = Blend_Albedo_Subsurface7608_g80308;
				float3 Emission = Final_Emissive2476_g80308;
				float Alpha = Final_Clip914_g80308;
				float AlphaClipThreshold = 0.5;

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				MetaInput metaInput = (MetaInput)0;
				metaInput.Albedo = BaseColor;
				metaInput.Emission = Emission;
				#ifdef EDITOR_VISUALIZATION
					metaInput.VizUV = IN.VizUV.xy;
					metaInput.LightCoord = IN.LightCoord;
				#endif

				return UnityMetaFragment(metaInput);
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "Universal2D"
			Tags { "LightMode"="Universal2D" }

			Blend [_render_src] [_render_dst], One Zero
			ZWrite On
			ZTest LEqual
			Offset 0 , 0
			ColorMask RGBA

			HLSLPROGRAM

			#define _NORMAL_DROPOFF_TS 1
			#define ASE_FOG 1
			#define _SPECULAR_SETUP 1
			#define ASE_ABSOLUTE_VERTEX_POS 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140007
			#define ASE_USING_SAMPLING_MACROS 1


			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS SHADERPASS_2D

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_COLOR
			#define ASE_NEEDS_FRAG_POSITION
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#pragma shader_feature_local_fragment TVE_FEATURE_CLIP
			#pragma shader_feature_local TVE_FEATURE_DETAIL
			#define TVE_IS_PLANT_SHADER
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END
			#define TVE_IS_STANDARD_SHADER
			#define THE_VEGETATION_ENGINE
			#define TVE_IS_UNIVERSAL_PIPELINE


			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_tangent : TANGENT;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 positionCS : SV_POSITION;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 positionWS : TEXCOORD0;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					float4 shadowCoord : TEXCOORD1;
				#endif
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_color : COLOR;
				float4 ase_texcoord6 : TEXCOORD6;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _EmissiveTexRemap;
			half4 _GradientColorOne;
			half4 _GradientColorTwo;
			half4 _VertexOcclusionRemap;
			half4 _DetailBlendRemap;
			half4 _VertexOcclusionColor;
			half4 _vertex_occlusion_mask_mode;
			half4 _SecondUVs;
			float4 _GradientMaskRemap;
			half4 _second_uvs_mode;
			half4 _SecondColorTwo;
			half4 _SecondColor;
			half4 _MainColor;
			half4 _MainColorTwo;
			half4 _motion_mask_mode_20;
			half4 _DetailMeshRemap;
			half4 _SubsurfaceColor;
			float4 _SubsurfaceDiffusion_Asset;
			half4 _detail_mesh_mode;
			half4 _SecondMaskRemap;
			half4 _MainMaskRemap;
			float4 _Color;
			half4 _MainUVs;
			half4 _motion_variation_mode;
			half4 _DetailMaskRemap;
			half4 _motion_mask_mode_30;
			half4 _EmissiveUVs;
			half4 _EmissiveColor;
			half3 _render_normals;
			half _DetailBlendMode;
			half _SecondMaskMinValue;
			half _DetailMaskMode;
			half _SecondColorMode;
			half _SecondMaskMaxValue;
			half _render_cull;
			half _SecondUVsScaleMode;
			half _MainColorMode;
			half _MainMaskMaxValue;
			half _MainMaskMinValue;
			half _MainAlbedoValue;
			half _MotionMaskMode_30;
			half _MotionAmplitude_32;
			float _MotionSpeed_32;
			float _MotionVariation_32;
			float _MotionScale_32;
			half _MotionAmplitude_22;
			half _MotionMaskMode_20;
			half _SecondAlbedoValue;
			half _DetailMaskMinValue;
			half _DetailBlendMinValue;
			half _MainNormalValue;
			half _SecondOcclusionValue;
			half _MainOcclusionValue;
			half _SecondSmoothnessValue;
			half _MainSmoothnessValue;
			half _RenderSpecular;
			float _emissive_intensity_value;
			half _EmissiveTexMaxValue;
			half _EmissiveTexMinValue;
			half _SubsurfaceMaskValue;
			half _SubsurfaceValue;
			half _VertexOcclusionOverlayMode;
			half _OverlayProjectionValue;
			half _SecondNormalValue;
			half _SecondUVsMode;
			half _DetailNormalValue;
			half _GlobalOverlay;
			half _VertexOcclusionMaxValue;
			half _VertexOcclusionMinValue;
			half _VertexOcclusionMaskMode;
			half _GradientMaxValue;
			half _GradientMinValue;
			half _DetailValue;
			half _DetailMode;
			half _DetailBlendMaxValue;
			half _DetailMeshMaxValue;
			half _DetailMeshMinValue;
			half _DetailMeshMode;
			half _DetailMaskMaxValue;
			half _BoundsRadiusValue;
			half _MotionAmplitude_10;
			half _MotionFacingValue;
			half _SubsurfaceDirectValue;
			half _SubsurfaceAmbientValue;
			half _SubsurfaceShadowValue;
			half _IsVersion;
			half _MessageBounds;
			half _SpaceSubsurface;
			half _VertexVariationMode;
			half _HasEmissive;
			half _HasGradient;
			half _IsCustomShader;
			half _IsShared;
			half _IsCollected;
			half _IsIdentifier;
			half _HasOcclusion;
			half _IsTVEShader;
			half _RenderNormals;
			half _RenderMode;
			half _render_src;
			half _render_dst;
			half _render_zw;
			half _render_coverage;
			float _IsPlantShader;
			float _SubsurfaceDiffusion;
			half _SubsurfaceAngleValue;
			half _Cutoff;
			half _RenderSSR;
			half _RenderZWrite;
			half _RenderClip;
			half _RenderCull;
			half _RenderQueue;
			half _RenderPriority;
			half _RenderDecals;
			half _SubsurfaceNormalValue;
			half _SubsurfaceScatteringValue;
			half _MotionValue_30;
			half _EmissiveMode;
			half _IsLiteShader;
			half _DetailSnowMode;
			half _IsStandardShader;
			half _MotionPosition_10;
			float _MotionScale_10;
			half _EmissiveIntensityMode;
			float _MotionSpeed_10;
			half _MotionVariationMode;
			half _BoundsHeightValue;
			half _DetailAlphaMode;
			half _MotionScale_20;
			half _MotionVariation_20;
			half _MotionSpeed_20;
			half _MotionVariation_10;
			half _MotionAmplitude_20;
			half _EmissiveFlagMode;
			half _MessageOcclusion;
			half _MotionValue_20;
			half _MessageMainMask;
			half _MessageSecondMask;
			half _CategoryDetail;
			half _CategorySubsurface;
			half _CategoryEmissive;
			half _EmissiveIntensityValue;
			half _CategoryMotion;
			half _CategoryOcclusion;
			half _CategoryGradient;
			half _CategoryRender;
			half _CategoryMain;
			half _CategoryGlobals;
			half _MessageSubsurface;
			half _CategoryObject;
			half _AlphaClipValue;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);
			TEXTURE2D(_BumpMap);
			SAMPLER(sampler_BumpMap);
			TEXTURE2D(TVE_NoiseTex);
			half TVE_NoiseTexTilling;
			half4 TVE_MotionParams;
			half4 TVE_TimeParams;
			SAMPLER(sampler_Linear_Repeat);
			half4 TVE_WindEditor;
			half TVE_MotionValue_10;
			half TVE_MotionValue_20;
			half TVE_MotionValue_30;
			TEXTURE2D(_MainAlbedoTex);
			SAMPLER(sampler_MainAlbedoTex);
			TEXTURE2D(_MainMaskTex);
			TEXTURE2D(_SecondAlbedoTex);
			SAMPLER(sampler_SecondAlbedoTex);
			TEXTURE2D(_SecondMaskTex);
			TEXTURE2D(_MainNormalTex);
			half4 TVE_OverlayColor;
			half TVE_OverlayValue;
			TEXTURE2D(_SecondNormalTex);
			half TVE_SubsurfaceValue;
			half TVE_OverlaySubsurface;
			half3 TVE_MainLightDirection;


			
			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID( v );
				UNITY_TRANSFER_INSTANCE_ID( v, o );
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				float3 VertexPosition3588_g80308 = v.positionOS.xyz;
				half3 Mesh_PivotsOS7730_g80308 = half3(0,0,0);
				float3 temp_output_7738_0_g80308 = ( VertexPosition3588_g80308 - Mesh_PivotsOS7730_g80308 );
				half3 VertexPos40_g80332 = temp_output_7738_0_g80308;
				half3 VertexPos40_g80333 = VertexPos40_g80332;
				float3 appendResult74_g80333 = (float3(VertexPos40_g80333.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g80333 = appendResult74_g80333;
				float3 break84_g80333 = VertexPos40_g80333;
				float3 appendResult81_g80333 = (float3(0.0 , break84_g80333.y , break84_g80333.z));
				half3 VertexPosOtherAxis82_g80333 = appendResult81_g80333;
				float3 ase_worldPos = TransformObjectToWorld( (v.positionOS).xyz );
				float3 vertexToFrag3890_g80308 = ase_worldPos;
				float3 WorldPosition3905_g80308 = vertexToFrag3890_g80308;
				float4x4 break19_g80338 = GetObjectToWorldMatrix();
				float3 appendResult20_g80338 = (float3(break19_g80338[ 0 ][ 3 ] , break19_g80338[ 1 ][ 3 ] , break19_g80338[ 2 ][ 3 ]));
				half3 ObjectData20_g80340 = appendResult20_g80338;
				half3 WorldData19_g80340 = ase_worldPos;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g80340 = WorldData19_g80340;
				#else
				float3 staticSwitch14_g80340 = ObjectData20_g80340;
				#endif
				float3 temp_output_114_0_g80338 = staticSwitch14_g80340;
				float3 vertexToFrag4224_g80308 = temp_output_114_0_g80338;
				float3 ObjectPosition4223_g80308 = vertexToFrag4224_g80308;
				float3 lerpResult7746_g80308 = lerp( WorldPosition3905_g80308 , ObjectPosition4223_g80308 , _MotionPosition_10);
				float3 Motion_10_Position7745_g80308 = lerpResult7746_g80308;
				half3 Input_Position419_g80317 = Motion_10_Position7745_g80308;
				float Input_MotionScale287_g80317 = ( _MotionScale_10 + 0.2 );
				half NoiseTex_Tilling735_g80317 = TVE_NoiseTexTilling;
				float2 temp_output_597_0_g80317 = (( Input_Position419_g80317 * Input_MotionScale287_g80317 * NoiseTex_Tilling735_g80317 * 0.0075 )).xz;
				float2 temp_output_447_0_g80373 = ((TVE_MotionParams).xy*2.0 + -1.0);
				half2 Global_Wind_DirectionWS4683_g80308 = temp_output_447_0_g80373;
				half2 Input_DirectionWS423_g80317 = Global_Wind_DirectionWS4683_g80308;
				float lerpResult128_g80318 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g80317 = _MotionSpeed_10;
				half Input_MotionVariation284_g80317 = _MotionVariation_10;
				half3 Input_Position167_g80354 = ObjectPosition4223_g80308;
				float dotResult156_g80354 = dot( (Input_Position167_g80354).xz , float2( 12.9898,78.233 ) );
				half Input_DynamicMode120_g80354 = 0.0;
				float Postion_Random162_g80354 = ( sin( dotResult156_g80354 ) * ( 1.0 - Input_DynamicMode120_g80354 ) );
				float4 break33_g80386 = _motion_variation_mode;
				float temp_output_30_0_g80386 = ( v.ase_color.r * break33_g80386.x );
				float temp_output_29_0_g80386 = ( v.ase_color.g * break33_g80386.y );
				float temp_output_31_0_g80386 = ( v.ase_color.b * break33_g80386.z );
				float lerpResult7828_g80308 = lerp( 0.0 , ( temp_output_30_0_g80386 + temp_output_29_0_g80386 + temp_output_31_0_g80386 + ( v.ase_color.a * break33_g80386.w ) ) , saturate( _MotionVariationMode ));
				float Mesh_Variation16_g80308 = lerpResult7828_g80308;
				half Input_Variation124_g80354 = Mesh_Variation16_g80308;
				half ObjectData20_g80356 = frac( ( Postion_Random162_g80354 + Input_Variation124_g80354 ) );
				half WorldData19_g80356 = Input_Variation124_g80354;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g80356 = WorldData19_g80356;
				#else
				float staticSwitch14_g80356 = ObjectData20_g80356;
				#endif
				float temp_output_112_0_g80354 = staticSwitch14_g80356;
				float clampResult171_g80354 = clamp( temp_output_112_0_g80354 , 0.01 , 0.99 );
				float Global_MeshVariation7760_g80308 = clampResult171_g80354;
				half Input_GlobalMeshVariation569_g80317 = Global_MeshVariation7760_g80308;
				float temp_output_630_0_g80317 = ( ( ( lerpResult128_g80318 * Input_MotionSpeed62_g80317 ) + ( Input_MotionVariation284_g80317 * Input_GlobalMeshVariation569_g80317 ) ) * 0.03 );
				float temp_output_607_0_g80317 = frac( temp_output_630_0_g80317 );
				float4 lerpResult590_g80317 = lerp( SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g80317 + ( -Input_DirectionWS423_g80317 * temp_output_607_0_g80317 ) ), 0.0 ) , SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g80317 + ( -Input_DirectionWS423_g80317 * frac( ( temp_output_630_0_g80317 + 0.5 ) ) ) ), 0.0 ) , ( abs( ( temp_output_607_0_g80317 - 0.5 ) ) / 0.5 ));
				half4 Noise_Complex703_g80317 = lerpResult590_g80317;
				float2 temp_output_645_0_g80317 = ((Noise_Complex703_g80317).rg*2.0 + -1.0);
				float2 break650_g80317 = temp_output_645_0_g80317;
				float3 appendResult649_g80317 = (float3(break650_g80317.x , 0.0 , break650_g80317.y));
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				half2 Global_Noise_OS5548_g80308 = (( mul( GetWorldToObjectMatrix(), float4( appendResult649_g80317 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_Noise_DirectionOS487_g80347 = Global_Noise_OS5548_g80308;
				float2 break448_g80373 = temp_output_447_0_g80373;
				float3 appendResult452_g80373 = (float3(break448_g80373.x , 0.0 , break448_g80373.y));
				half2 Global_Wind_DirectionOS5692_g80308 = (( mul( GetWorldToObjectMatrix(), float4( appendResult452_g80373 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_Wind_DirectionOS458_g80347 = Global_Wind_DirectionOS5692_g80308;
				float4 break322_g80373 = TVE_MotionParams;
				float lerpResult457_g80373 = lerp( break322_g80373.z , TVE_WindEditor.z , TVE_WindEditor.w);
				float temp_output_459_0_g80373 = ( 1.0 - lerpResult457_g80373 );
				half Global_Wind_Power2223_g80308 = ( 1.0 - ( temp_output_459_0_g80373 * temp_output_459_0_g80373 ) );
				half Input_WindPower449_g80347 = Global_Wind_Power2223_g80308;
				float2 lerpResult516_g80347 = lerp( Input_Noise_DirectionOS487_g80347 , Input_Wind_DirectionOS458_g80347 , ( Input_WindPower449_g80347 * 0.6 ));
				half Mesh_Height1524_g80308 = saturate( ( v.positionOS.xyz.y / _BoundsHeightValue ) );
				half Input_MeshHeight388_g80347 = Mesh_Height1524_g80308;
				half ObjectData20_g80348 = Input_MeshHeight388_g80347;
				half Input_BoundsHeight390_g80347 = 1.0;
				half WorldData19_g80348 = ( Input_MeshHeight388_g80347 * Input_MeshHeight388_g80347 * Input_BoundsHeight390_g80347 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g80348 = WorldData19_g80348;
				#else
				float staticSwitch14_g80348 = ObjectData20_g80348;
				#endif
				half Final_Motion10_Mask321_g80347 = ( staticSwitch14_g80348 * 2.0 );
				half Input_BendingAmplitude376_g80347 = _MotionAmplitude_10;
				half Global_MotionValue640_g80347 = TVE_MotionValue_10;
				half2 Final_Bending631_g80347 = ( lerpResult516_g80347 * ( Final_Motion10_Mask321_g80347 * Input_BendingAmplitude376_g80347 * Input_WindPower449_g80347 * Input_WindPower449_g80347 * Global_MotionValue640_g80347 ) );
				float2 break636_g80347 = Final_Bending631_g80347;
				float3 appendResult637_g80347 = (float3(break636_g80347.x , 0.0 , break636_g80347.y));
				half3 Motion_10_Bending216_g80308 = appendResult637_g80347;
				half3 Angle44_g80332 = Motion_10_Bending216_g80308;
				half Angle44_g80333 = (Angle44_g80332).z;
				half3 VertexPos40_g80334 = ( VertexPosRotationAxis50_g80333 + ( VertexPosOtherAxis82_g80333 * cos( Angle44_g80333 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g80333 ) * sin( Angle44_g80333 ) ) );
				float3 appendResult74_g80334 = (float3(0.0 , 0.0 , VertexPos40_g80334.z));
				half3 VertexPosRotationAxis50_g80334 = appendResult74_g80334;
				float3 break84_g80334 = VertexPos40_g80334;
				float3 appendResult81_g80334 = (float3(break84_g80334.x , break84_g80334.y , 0.0));
				half3 VertexPosOtherAxis82_g80334 = appendResult81_g80334;
				half Angle44_g80334 = -(Angle44_g80332).x;
				half3 Input_Position419_g80359 = WorldPosition3905_g80308;
				float3 break459_g80359 = Input_Position419_g80359;
				float Sum_Position446_g80359 = ( break459_g80359.x + break459_g80359.y + break459_g80359.z );
				half Input_MotionScale321_g80359 = ( _MotionScale_20 * 0.1 );
				half Input_MotionVariation330_g80359 = _MotionVariation_20;
				half Input_GlobalVariation400_g80359 = Global_MeshVariation7760_g80308;
				float lerpResult128_g80360 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g80359 = _MotionSpeed_20;
				float temp_output_404_0_g80359 = ( lerpResult128_g80360 * Input_MotionSpeed62_g80359 );
				half Motion_SineA450_g80359 = sin( ( ( Sum_Position446_g80359 * Input_MotionScale321_g80359 ) + ( Input_MotionVariation330_g80359 * Input_GlobalVariation400_g80359 ) + temp_output_404_0_g80359 ) );
				half Motion_SineB395_g80359 = sin( ( ( temp_output_404_0_g80359 * 0.6842 ) + ( Sum_Position446_g80359 * Input_MotionScale321_g80359 ) ) );
				half3 Input_Position419_g80345 = VertexPosition3588_g80308;
				float3 normalizeResult518_g80345 = normalize( Input_Position419_g80345 );
				half2 Input_DirectionOS423_g80345 = Global_Wind_DirectionOS5692_g80308;
				float2 break521_g80345 = -Input_DirectionOS423_g80345;
				float3 appendResult522_g80345 = (float3(break521_g80345.x , 0.0 , break521_g80345.y));
				float dotResult519_g80345 = dot( normalizeResult518_g80345 , appendResult522_g80345 );
				half Input_Value62_g80345 = _MotionFacingValue;
				float lerpResult524_g80345 = lerp( 1.0 , (dotResult519_g80345*0.5 + 0.5) , Input_Value62_g80345);
				half ObjectData20_g80346 = max( lerpResult524_g80345 , 0.001 );
				half WorldData19_g80346 = 1.0;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g80346 = WorldData19_g80346;
				#else
				float staticSwitch14_g80346 = ObjectData20_g80346;
				#endif
				half Motion_FacingMask7691_g80308 = staticSwitch14_g80346;
				half Motion_20_Amplitude7628_g80308 = Motion_FacingMask7691_g80308;
				half Input_MotionAmplitude384_g80359 = Motion_20_Amplitude7628_g80308;
				half Input_GlobalWind407_g80359 = Global_Wind_Power2223_g80308;
				float4 break638_g80317 = abs( Noise_Complex703_g80317 );
				half Global_Noise_B5526_g80308 = break638_g80317.b;
				half Input_GlobalNoise411_g80359 = Global_Noise_B5526_g80308;
				float lerpResult413_g80359 = lerp( 1.8 , 0.4 , Input_GlobalWind407_g80359);
				half Motion_Amplitude418_g80359 = ( Input_MotionAmplitude384_g80359 * Input_GlobalWind407_g80359 * pow( Input_GlobalNoise411_g80359 , lerpResult413_g80359 ) );
				half Input_Squash58_g80359 = _MotionAmplitude_20;
				float3 appendResult7790_g80308 = (float3(0.0 , v.positionOS.xyz.y , 0.0));
				half Mesh_Spherical7697_g80308 = saturate( ( distance( v.positionOS.xyz , appendResult7790_g80308 ) / _BoundsRadiusValue ) );
				float4 break33_g80370 = _motion_mask_mode_20;
				float temp_output_30_0_g80370 = ( v.ase_color.r * break33_g80370.x );
				float temp_output_29_0_g80370 = ( v.ase_color.g * break33_g80370.y );
				float temp_output_31_0_g80370 = ( v.ase_color.b * break33_g80370.z );
				float lerpResult7813_g80308 = lerp( Mesh_Spherical7697_g80308 , ( temp_output_30_0_g80370 + temp_output_29_0_g80370 + temp_output_31_0_g80370 + ( v.ase_color.a * break33_g80370.w ) ) , saturate( _MotionMaskMode_20 ));
				half Mesh_Motion_207834_g80308 = lerpResult7813_g80308;
				half Input_MeshMotion_20388_g80359 = Mesh_Motion_207834_g80308;
				half Input_BoundsRadius390_g80359 = 1.0;
				half Global_MotionValue462_g80359 = TVE_MotionValue_20;
				half2 Input_DirectionOS366_g80359 = Global_Wind_DirectionOS5692_g80308;
				float2 break371_g80359 = Input_DirectionOS366_g80359;
				float3 appendResult372_g80359 = (float3(break371_g80359.x , ( Motion_SineA450_g80359 * 0.3 ) , break371_g80359.y));
				half3 Motion_20_Squash7632_g80308 = ( ( (max( Motion_SineA450_g80359 , Motion_SineB395_g80359 )*0.5 + 0.5) * Motion_Amplitude418_g80359 * Input_Squash58_g80359 * Input_MeshMotion_20388_g80359 * Input_BoundsRadius390_g80359 * Global_MotionValue462_g80359 ) * appendResult372_g80359 );
				half3 VertexPos40_g80321 = ( ( VertexPosRotationAxis50_g80334 + ( VertexPosOtherAxis82_g80334 * cos( Angle44_g80334 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g80334 ) * sin( Angle44_g80334 ) ) ) + Motion_20_Squash7632_g80308 );
				float3 appendResult74_g80321 = (float3(0.0 , VertexPos40_g80321.y , 0.0));
				float3 VertexPosRotationAxis50_g80321 = appendResult74_g80321;
				float3 break84_g80321 = VertexPos40_g80321;
				float3 appendResult81_g80321 = (float3(break84_g80321.x , 0.0 , break84_g80321.z));
				float3 VertexPosOtherAxis82_g80321 = appendResult81_g80321;
				half Input_Rolling379_g80359 = _MotionAmplitude_22;
				half Motion_20_Rolling7633_g80308 = ( Motion_SineA450_g80359 * Motion_Amplitude418_g80359 * Input_Rolling379_g80359 * Input_MeshMotion_20388_g80359 * Global_MotionValue462_g80359 );
				half Angle44_g80321 = Motion_20_Rolling7633_g80308;
				half3 Input_Position500_g80326 = WorldPosition3905_g80308;
				half Input_MotionScale321_g80326 = _MotionScale_32;
				half Input_MotionVariation330_g80326 = _MotionVariation_32;
				half Input_GlobalVariation372_g80326 = Global_MeshVariation7760_g80308;
				float lerpResult128_g80327 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g80326 = _MotionSpeed_32;
				float4 tex2DNode460_g80326 = SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( ( (Input_Position500_g80326).xz * Input_MotionScale321_g80326 * 0.03 ) + ( Input_MotionVariation330_g80326 * Input_GlobalVariation372_g80326 ) + ( lerpResult128_g80327 * Input_MotionSpeed62_g80326 * 0.02 ) ), 0.0 );
				float3 appendResult462_g80326 = (float3(tex2DNode460_g80326.r , tex2DNode460_g80326.g , tex2DNode460_g80326.b));
				half3 Flutter_Texture489_g80326 = (appendResult462_g80326*2.0 + -1.0);
				half Motion_30_Amplitude7534_g80308 = ( _MotionAmplitude_32 * Motion_FacingMask7691_g80308 );
				half Input_MotionAmplitude58_g80326 = Motion_30_Amplitude7534_g80308;
				float4 break33_g80369 = _motion_mask_mode_30;
				float temp_output_30_0_g80369 = ( v.ase_color.r * break33_g80369.x );
				float temp_output_29_0_g80369 = ( v.ase_color.g * break33_g80369.y );
				float temp_output_31_0_g80369 = ( v.ase_color.b * break33_g80369.z );
				float lerpResult7820_g80308 = lerp( v.ase_texcoord.y , ( temp_output_30_0_g80369 + temp_output_29_0_g80369 + temp_output_31_0_g80369 + ( v.ase_color.a * break33_g80369.w ) ) , saturate( _MotionMaskMode_30 ));
				half Mesh_Motion_30144_g80308 = lerpResult7820_g80308;
				half Input_MeshMotion_30374_g80326 = Mesh_Motion_30144_g80308;
				half Input_GlobalWind471_g80326 = Global_Wind_Power2223_g80308;
				half Global_MotionValue503_g80326 = TVE_MotionValue_30;
				half Input_GlobalNoise472_g80326 = Global_Noise_B5526_g80308;
				float lerpResult466_g80326 = lerp( 2.4 , 0.6 , Input_GlobalWind471_g80326);
				half Flutter_Amplitude491_g80326 = ( Input_MotionAmplitude58_g80326 * Input_MeshMotion_30374_g80326 * Input_GlobalWind471_g80326 * Global_MotionValue503_g80326 * pow( Input_GlobalNoise472_g80326 , lerpResult466_g80326 ) );
				half3 Motion_30_Flutter263_g80308 = ( Flutter_Texture489_g80326 * Flutter_Amplitude491_g80326 );
				float3 Vertex_Motion_Object7655_g80308 = ( ( ( VertexPosRotationAxis50_g80321 + ( VertexPosOtherAxis82_g80321 * cos( Angle44_g80321 ) ) + ( cross( float3(0,1,0) , VertexPosOtherAxis82_g80321 ) * sin( Angle44_g80321 ) ) ) + Motion_30_Flutter263_g80308 ) + Mesh_PivotsOS7730_g80308 );
				float3 Final_VertexPosition890_g80308 = Vertex_Motion_Object7655_g80308;
				
				float4 break33_g80365 = _second_uvs_mode;
				float2 temp_output_30_0_g80365 = ( v.ase_texcoord.xy * break33_g80365.x );
				float2 temp_output_29_0_g80365 = ( v.ase_texcoord3.xy * break33_g80365.y );
				float2 temp_output_31_0_g80365 = ( (WorldPosition3905_g80308).xz * break33_g80365.z );
				half2 Second_UVs_Tilling7781_g80308 = (_SecondUVs).xy;
				half2 Second_UVs_Scale7782_g80308 = ( 1.0 / Second_UVs_Tilling7781_g80308 );
				float2 lerpResult7786_g80308 = lerp( Second_UVs_Tilling7781_g80308 , Second_UVs_Scale7782_g80308 , _SecondUVsScaleMode);
				half2 Second_UVs_Offset7777_g80308 = (_SecondUVs).zw;
				float2 vertexToFrag11_g80309 = ( ( ( temp_output_30_0_g80365 + temp_output_29_0_g80365 + temp_output_31_0_g80365 ) * lerpResult7786_g80308 ) + Second_UVs_Offset7777_g80308 );
				o.ase_texcoord2.zw = vertexToFrag11_g80309;
				float3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				o.ase_texcoord3.xyz = ase_worldTangent;
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				o.ase_texcoord4.xyz = ase_worldNormal;
				float ase_vertexTangentSign = v.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord5.xyz = ase_worldBitangent;
				
				o.ase_texcoord2.xy = v.ase_texcoord.xy;
				o.ase_color = v.ase_color;
				o.ase_texcoord6 = v.positionOS;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord3.w = 0;
				o.ase_texcoord4.w = 0;
				o.ase_texcoord5.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = Final_VertexPosition890_g80308;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.positionOS.xyz = vertexValue;
				#else
					v.positionOS.xyz += vertexValue;
				#endif

				v.normalOS = v.normalOS;

				VertexPositionInputs vertexInput = GetVertexPositionInputs( v.positionOS.xyz );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					o.positionWS = vertexInput.positionWS;
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				o.positionCS = vertexInput.positionCS;

				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_tangent : TANGENT;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.positionOS;
				o.normalOS = v.normalOS;
				o.ase_color = v.ase_color;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_texcoord3 = v.ase_texcoord3;
				o.ase_tangent = v.ase_tangent;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.positionOS = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].vertex.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(VertexOutput IN  ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID( IN );
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 WorldPosition = IN.positionWS;
				#endif

				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				half2 Main_UVs15_g80308 = ( ( IN.ase_texcoord2.xy * (_MainUVs).xy ) + (_MainUVs).zw );
				float4 tex2DNode29_g80308 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs15_g80308 );
				float3 lerpResult6223_g80308 = lerp( float3( 1,1,1 ) , (tex2DNode29_g80308).rgb , _MainAlbedoValue);
				float4 tex2DNode35_g80308 = SAMPLE_TEXTURE2D( _MainMaskTex, sampler_Linear_Repeat, Main_UVs15_g80308 );
				half Main_Mask57_g80308 = tex2DNode35_g80308.b;
				float clampResult17_g80376 = clamp( Main_Mask57_g80308 , 0.0001 , 0.9999 );
				float temp_output_7_0_g80377 = _MainMaskMinValue;
				float temp_output_10_0_g80377 = ( _MainMaskMaxValue - temp_output_7_0_g80377 );
				half Main_Mask_Remap5765_g80308 = saturate( ( ( clampResult17_g80376 - temp_output_7_0_g80377 ) / ( temp_output_10_0_g80377 + 0.0001 ) ) );
				float lerpResult7896_g80308 = lerp( 1.0 , Main_Mask_Remap5765_g80308 , _MainColorMode);
				float4 lerpResult7876_g80308 = lerp( _MainColorTwo , _MainColor , lerpResult7896_g80308);
				half3 Main_Color_RGB7884_g80308 = (lerpResult7876_g80308).rgb;
				half3 Main_Albedo99_g80308 = ( lerpResult6223_g80308 * Main_Color_RGB7884_g80308 );
				float2 vertexToFrag11_g80309 = IN.ase_texcoord2.zw;
				half2 Second_UVs17_g80308 = vertexToFrag11_g80309;
				float4 tex2DNode89_g80308 = SAMPLE_TEXTURE2D( _SecondAlbedoTex, sampler_SecondAlbedoTex, Second_UVs17_g80308 );
				float3 lerpResult6225_g80308 = lerp( float3( 1,1,1 ) , (tex2DNode89_g80308).rgb , _SecondAlbedoValue);
				float4 tex2DNode33_g80308 = SAMPLE_TEXTURE2D( _SecondMaskTex, sampler_Linear_Repeat, Second_UVs17_g80308 );
				half Second_Mask81_g80308 = tex2DNode33_g80308.b;
				float clampResult17_g80378 = clamp( Second_Mask81_g80308 , 0.0001 , 0.9999 );
				float temp_output_7_0_g80379 = _SecondMaskMinValue;
				float temp_output_10_0_g80379 = ( _SecondMaskMaxValue - temp_output_7_0_g80379 );
				half Second_Mask_Remap6130_g80308 = saturate( ( ( clampResult17_g80378 - temp_output_7_0_g80379 ) / ( temp_output_10_0_g80379 + 0.0001 ) ) );
				float lerpResult7897_g80308 = lerp( 1.0 , Second_Mask_Remap6130_g80308 , _SecondColorMode);
				float4 lerpResult7886_g80308 = lerp( _SecondColorTwo , _SecondColor , lerpResult7897_g80308);
				half3 Second_Color_RGB7894_g80308 = (lerpResult7886_g80308).rgb;
				half3 Second_Albedo153_g80308 = ( lerpResult6225_g80308 * Second_Color_RGB7894_g80308 );
				#ifdef UNITY_COLORSPACE_GAMMA
				float staticSwitch1_g80311 = 2.0;
				#else
				float staticSwitch1_g80311 = 4.594794;
				#endif
				float3 lerpResult4834_g80308 = lerp( ( Main_Albedo99_g80308 * Second_Albedo153_g80308 * staticSwitch1_g80311 ) , Second_Albedo153_g80308 , _DetailBlendMode);
				float lerpResult6885_g80308 = lerp( Main_Mask57_g80308 , Second_Mask81_g80308 , _DetailMaskMode);
				float clampResult17_g80325 = clamp( lerpResult6885_g80308 , 0.0001 , 0.9999 );
				float temp_output_7_0_g80324 = _DetailMaskMinValue;
				float temp_output_10_0_g80324 = ( _DetailMaskMaxValue - temp_output_7_0_g80324 );
				half Blend_Mask_Texture6794_g80308 = saturate( ( ( clampResult17_g80325 - temp_output_7_0_g80324 ) / ( temp_output_10_0_g80324 + 0.0001 ) ) );
				half4 Normal_Packed45_g80375 = SAMPLE_TEXTURE2D( _MainNormalTex, sampler_Linear_Repeat, Main_UVs15_g80308 );
				float2 appendResult58_g80375 = (float2(( (Normal_Packed45_g80375).x * (Normal_Packed45_g80375).w ) , (Normal_Packed45_g80375).y));
				half2 Normal_Default50_g80375 = appendResult58_g80375;
				half2 Normal_ASTC41_g80375 = (Normal_Packed45_g80375).xy;
				#ifdef UNITY_ASTC_NORMALMAP_ENCODING
				float2 staticSwitch38_g80375 = Normal_ASTC41_g80375;
				#else
				float2 staticSwitch38_g80375 = Normal_Default50_g80375;
				#endif
				half2 Normal_NO_DTX544_g80375 = (Normal_Packed45_g80375).wy;
				#ifdef UNITY_NO_DXT5nm
				float2 staticSwitch37_g80375 = Normal_NO_DTX544_g80375;
				#else
				float2 staticSwitch37_g80375 = staticSwitch38_g80375;
				#endif
				float2 temp_output_6555_0_g80308 = ( (staticSwitch37_g80375*2.0 + -1.0) * _MainNormalValue );
				float3 appendResult7388_g80308 = (float3(temp_output_6555_0_g80308 , 1.0));
				float3 ase_worldTangent = IN.ase_texcoord3.xyz;
				float3 ase_worldNormal = IN.ase_texcoord4.xyz;
				float3 ase_worldBitangent = IN.ase_texcoord5.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 tanNormal7389_g80308 = appendResult7388_g80308;
				float3 worldNormal7389_g80308 = float3(dot(tanToWorld0,tanNormal7389_g80308), dot(tanToWorld1,tanNormal7389_g80308), dot(tanToWorld2,tanNormal7389_g80308));
				half3 Main_NormalWS7390_g80308 = worldNormal7389_g80308;
				float4 break33_g80385 = _detail_mesh_mode;
				float temp_output_30_0_g80385 = ( IN.ase_color.r * break33_g80385.x );
				float temp_output_29_0_g80385 = ( IN.ase_color.g * break33_g80385.y );
				float temp_output_31_0_g80385 = ( IN.ase_color.b * break33_g80385.z );
				float lerpResult7836_g80308 = lerp( ((Main_NormalWS7390_g80308).y*0.5 + 0.5) , ( temp_output_30_0_g80385 + temp_output_29_0_g80385 + temp_output_31_0_g80385 + ( IN.ase_color.a * break33_g80385.w ) ) , saturate( _DetailMeshMode ));
				float clampResult17_g80323 = clamp( lerpResult7836_g80308 , 0.0001 , 0.9999 );
				float temp_output_7_0_g80322 = _DetailMeshMinValue;
				float temp_output_10_0_g80322 = ( _DetailMeshMaxValue - temp_output_7_0_g80322 );
				half Blend_Mask_Mesh1540_g80308 = saturate( ( ( clampResult17_g80323 - temp_output_7_0_g80322 ) / ( temp_output_10_0_g80322 + 0.0001 ) ) );
				float clampResult17_g80352 = clamp( ( Blend_Mask_Texture6794_g80308 * Blend_Mask_Mesh1540_g80308 ) , 0.0001 , 0.9999 );
				float temp_output_7_0_g80353 = _DetailBlendMinValue;
				float temp_output_10_0_g80353 = ( _DetailBlendMaxValue - temp_output_7_0_g80353 );
				half Blend_Mask147_g80308 = ( saturate( ( ( clampResult17_g80352 - temp_output_7_0_g80353 ) / ( temp_output_10_0_g80353 + 0.0001 ) ) ) * _DetailMode * _DetailValue );
				float3 lerpResult235_g80308 = lerp( Main_Albedo99_g80308 , lerpResult4834_g80308 , Blend_Mask147_g80308);
				#ifdef TVE_FEATURE_DETAIL
				float3 staticSwitch255_g80308 = lerpResult235_g80308;
				#else
				float3 staticSwitch255_g80308 = Main_Albedo99_g80308;
				#endif
				half3 Blend_Albedo265_g80308 = staticSwitch255_g80308;
				half Mesh_Height1524_g80308 = saturate( ( IN.ase_texcoord6.xyz.y / _BoundsHeightValue ) );
				float temp_output_7_0_g80367 = _GradientMinValue;
				float temp_output_10_0_g80367 = ( _GradientMaxValue - temp_output_7_0_g80367 );
				half Gradient_Value2784_g80308 = saturate( ( ( Mesh_Height1524_g80308 - temp_output_7_0_g80367 ) / ( temp_output_10_0_g80367 + 0.0001 ) ) );
				float3 lerpResult2779_g80308 = lerp( (_GradientColorTwo).rgb , (_GradientColorOne).rgb , Gradient_Value2784_g80308);
				float lerpResult6617_g80308 = lerp( Main_Mask_Remap5765_g80308 , Second_Mask_Remap6130_g80308 , Blend_Mask147_g80308);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch6623_g80308 = lerpResult6617_g80308;
				#else
				float staticSwitch6623_g80308 = Main_Mask_Remap5765_g80308;
				#endif
				half Blend_Mask_Remap6621_g80308 = staticSwitch6623_g80308;
				half Gradient_Mask6207_g80308 = Blend_Mask_Remap6621_g80308;
				float3 lerpResult6208_g80308 = lerp( float3( 1,1,1 ) , lerpResult2779_g80308 , Gradient_Mask6207_g80308);
				half3 Tint_Gradient_Color5769_g80308 = lerpResult6208_g80308;
				float3 appendResult7790_g80308 = (float3(0.0 , IN.ase_texcoord6.xyz.y , 0.0));
				half Mesh_Spherical7697_g80308 = saturate( ( distance( IN.ase_texcoord6.xyz , appendResult7790_g80308 ) / _BoundsRadiusValue ) );
				float4 break33_g80384 = _vertex_occlusion_mask_mode;
				float temp_output_30_0_g80384 = ( IN.ase_color.r * break33_g80384.x );
				float temp_output_29_0_g80384 = ( IN.ase_color.g * break33_g80384.y );
				float temp_output_31_0_g80384 = ( IN.ase_color.b * break33_g80384.z );
				float lerpResult7809_g80308 = lerp( Mesh_Spherical7697_g80308 , ( temp_output_30_0_g80384 + temp_output_29_0_g80384 + temp_output_31_0_g80384 + ( IN.ase_color.a * break33_g80384.w ) ) , saturate( _VertexOcclusionMaskMode ));
				float clampResult17_g80371 = clamp( lerpResult7809_g80308 , 0.0001 , 0.9999 );
				float temp_output_7_0_g80366 = _VertexOcclusionMinValue;
				float temp_output_10_0_g80366 = ( _VertexOcclusionMaxValue - temp_output_7_0_g80366 );
				half Occlusion_Mask6432_g80308 = saturate( ( ( clampResult17_g80371 - temp_output_7_0_g80366 ) / ( temp_output_10_0_g80366 + 0.0001 ) ) );
				float3 lerpResult2945_g80308 = lerp( (_VertexOcclusionColor).rgb , float3( 1,1,1 ) , Occlusion_Mask6432_g80308);
				half3 Occlusion_Color648_g80308 = lerpResult2945_g80308;
				half3 Blend_Albedo_Tinted2808_g80308 = ( Blend_Albedo265_g80308 * Tint_Gradient_Color5769_g80308 * Occlusion_Color648_g80308 );
				half3 Global_OverlayColor1758_g80308 = (TVE_OverlayColor).rgb;
				half Global_OverlayIntensity154_g80308 = TVE_OverlayValue;
				half Overlay_Value5738_g80308 = ( _GlobalOverlay * Global_OverlayIntensity154_g80308 );
				half2 Main_Normal137_g80308 = temp_output_6555_0_g80308;
				float2 lerpResult3372_g80308 = lerp( float2( 0,0 ) , Main_Normal137_g80308 , _DetailNormalValue);
				float3x3 ase_worldToTangent = float3x3(ase_worldTangent,ase_worldBitangent,ase_worldNormal);
				half4 Normal_Packed45_g80380 = SAMPLE_TEXTURE2D( _SecondNormalTex, sampler_Linear_Repeat, Second_UVs17_g80308 );
				float2 appendResult58_g80380 = (float2(( (Normal_Packed45_g80380).x * (Normal_Packed45_g80380).w ) , (Normal_Packed45_g80380).y));
				half2 Normal_Default50_g80380 = appendResult58_g80380;
				half2 Normal_ASTC41_g80380 = (Normal_Packed45_g80380).xy;
				#ifdef UNITY_ASTC_NORMALMAP_ENCODING
				float2 staticSwitch38_g80380 = Normal_ASTC41_g80380;
				#else
				float2 staticSwitch38_g80380 = Normal_Default50_g80380;
				#endif
				half2 Normal_NO_DTX544_g80380 = (Normal_Packed45_g80380).wy;
				#ifdef UNITY_NO_DXT5nm
				float2 staticSwitch37_g80380 = Normal_NO_DTX544_g80380;
				#else
				float2 staticSwitch37_g80380 = staticSwitch38_g80380;
				#endif
				float2 temp_output_6560_0_g80308 = ( (staticSwitch37_g80380*2.0 + -1.0) * _SecondNormalValue );
				half2 Normal_Planar45_g80381 = temp_output_6560_0_g80308;
				float2 break64_g80381 = Normal_Planar45_g80381;
				float3 appendResult65_g80381 = (float3(break64_g80381.x , 0.0 , break64_g80381.y));
				float2 temp_output_7775_0_g80308 = (mul( ase_worldToTangent, appendResult65_g80381 )).xy;
				float2 ifLocalVar7776_g80308 = 0;
				if( _SecondUVsMode >= 2.0 )
				ifLocalVar7776_g80308 = temp_output_7775_0_g80308;
				else
				ifLocalVar7776_g80308 = temp_output_6560_0_g80308;
				half2 Second_Normal179_g80308 = ifLocalVar7776_g80308;
				float2 temp_output_36_0_g80312 = ( lerpResult3372_g80308 + Second_Normal179_g80308 );
				float2 lerpResult3376_g80308 = lerp( Main_Normal137_g80308 , temp_output_36_0_g80312 , Blend_Mask147_g80308);
				#ifdef TVE_FEATURE_DETAIL
				float2 staticSwitch267_g80308 = lerpResult3376_g80308;
				#else
				float2 staticSwitch267_g80308 = Main_Normal137_g80308;
				#endif
				half2 Blend_Normal312_g80308 = staticSwitch267_g80308;
				float3 appendResult7377_g80308 = (float3(Blend_Normal312_g80308 , 1.0));
				float3 tanNormal7376_g80308 = appendResult7377_g80308;
				float3 worldNormal7376_g80308 = float3(dot(tanToWorld0,tanNormal7376_g80308), dot(tanToWorld1,tanNormal7376_g80308), dot(tanToWorld2,tanNormal7376_g80308));
				half3 Blend_NormalWS7375_g80308 = worldNormal7376_g80308;
				float lerpResult7510_g80308 = lerp( 1.0 , saturate( (Blend_NormalWS7375_g80308).y ) , _OverlayProjectionValue);
				half Overlay_Projection6081_g80308 = lerpResult7510_g80308;
				float3 temp_output_3_0_g80316 = ( Blend_Albedo265_g80308 * Tint_Gradient_Color5769_g80308 );
				float dotResult20_g80316 = dot( temp_output_3_0_g80316 , float3(0.2126,0.7152,0.0722) );
				float clampResult6740_g80308 = clamp( saturate( ( dotResult20_g80316 * 5.0 ) ) , 0.2 , 1.0 );
				half Blend_Albedo_Globals6410_g80308 = clampResult6740_g80308;
				half Overlay_Shading6688_g80308 = Blend_Albedo_Globals6410_g80308;
				half Occlusion_Alpha6463_g80308 = _VertexOcclusionColor.a;
				float lerpResult7923_g80308 = lerp( Occlusion_Mask6432_g80308 , ( 1.0 - Occlusion_Mask6432_g80308 ) , _VertexOcclusionOverlayMode);
				float lerpResult7921_g80308 = lerp( Occlusion_Alpha6463_g80308 , 1.0 , lerpResult7923_g80308);
				half Occlusion_Overlay6471_g80308 = lerpResult7921_g80308;
				half Overlay_Variation4560_g80308 = 1.0;
				float temp_output_7_0_g80313 = 0.1;
				float temp_output_10_0_g80313 = ( 0.2 - temp_output_7_0_g80313 );
				half Overlay_Mask269_g80308 = saturate( ( ( ( Overlay_Value5738_g80308 * Overlay_Projection6081_g80308 * Overlay_Shading6688_g80308 * Occlusion_Overlay6471_g80308 * Overlay_Variation4560_g80308 ) - temp_output_7_0_g80313 ) / ( temp_output_10_0_g80313 + 0.0001 ) ) );
				float3 lerpResult336_g80308 = lerp( Blend_Albedo_Tinted2808_g80308 , Global_OverlayColor1758_g80308 , Overlay_Mask269_g80308);
				half3 Blend_Albedo_Overlay359_g80308 = lerpResult336_g80308;
				half3 Subsurface_Color1722_g80308 = ( (_SubsurfaceColor).rgb * Blend_Albedo_Overlay359_g80308 );
				half Global_Subsurface7580_g80308 = TVE_SubsurfaceValue;
				half Global_OverlaySubsurface5667_g80308 = TVE_OverlaySubsurface;
				float lerpResult7362_g80308 = lerp( 1.0 , Global_OverlaySubsurface5667_g80308 , Occlusion_Mask6432_g80308);
				half Overlay_Subsurface7361_g80308 = lerpResult7362_g80308;
				half Subsurface_Intensity1752_g80308 = ( _SubsurfaceValue * Global_Subsurface7580_g80308 * Overlay_Subsurface7361_g80308 );
				float lerpResult7903_g80308 = lerp( 1.0 , Blend_Mask_Remap6621_g80308 , _SubsurfaceMaskValue);
				half Subsurface_Mask1557_g80308 = lerpResult7903_g80308;
				half3 MainLight_Direction7581_g80308 = TVE_MainLightDirection;
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 normalizeResult7596_g80308 = normalize( ase_worldViewDir );
				float3 ViewDirection7598_g80308 = normalizeResult7596_g80308;
				float dotResult7591_g80308 = dot( -MainLight_Direction7581_g80308 , ViewDirection7598_g80308 );
				float saferPower7590_g80308 = abs( saturate( dotResult7591_g80308 ) );
				#ifdef UNITY_PASS_FORWARDADD
				float staticSwitch7595_g80308 = 0.0;
				#else
				float staticSwitch7595_g80308 = ( pow( saferPower7590_g80308 , _SubsurfaceAngleValue ) * _SubsurfaceScatteringValue );
				#endif
				half Mask_Subsurface_View7587_g80308 = staticSwitch7595_g80308;
				half3 Subsurface_Approximation7607_g80308 = ( Subsurface_Color1722_g80308 * Subsurface_Intensity1752_g80308 * Subsurface_Mask1557_g80308 * Mask_Subsurface_View7587_g80308 );
				half3 Blend_Albedo_Subsurface7608_g80308 = ( Blend_Albedo_Overlay359_g80308 + Subsurface_Approximation7607_g80308 );
				
				float localCustomAlphaClip19_g80314 = ( 0.0 );
				half Main_Alpha316_g80308 = tex2DNode29_g80308.a;
				half Second_Alpha5007_g80308 = tex2DNode89_g80308.a;
				float lerpResult6153_g80308 = lerp( Main_Alpha316_g80308 , Second_Alpha5007_g80308 , Blend_Mask147_g80308);
				float lerpResult6785_g80308 = lerp( ( Main_Alpha316_g80308 * Second_Alpha5007_g80308 ) , lerpResult6153_g80308 , _DetailAlphaMode);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch6158_g80308 = lerpResult6785_g80308;
				#else
				float staticSwitch6158_g80308 = Main_Alpha316_g80308;
				#endif
				half Blend_Alpha6157_g80308 = staticSwitch6158_g80308;
				half AlphaTreshold2132_g80308 = _AlphaClipValue;
				float temp_output_3_0_g80314 = ( Blend_Alpha6157_g80308 - AlphaTreshold2132_g80308 );
				float Alpha19_g80314 = temp_output_3_0_g80314;
				float temp_output_15_0_g80314 = 0.01;
				float Treshold19_g80314 = temp_output_15_0_g80314;
				{
				#if defined (TVE_FEATURE_CLIP)
				#if defined (TVE_IS_HD_PIPELINE)
				#if !defined(SHADERPASS_FORWARD_BYPASS_ALPHA_TEST) && !defined(SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST)
				clip(Alpha19_g80314 - Treshold19_g80314);
				#endif
				#else
				clip(Alpha19_g80314 - Treshold19_g80314);
				#endif
				#endif
				}
				half Final_Clip914_g80308 = Alpha19_g80314;
				

				float3 BaseColor = Blend_Albedo_Subsurface7608_g80308;
				float Alpha = Final_Clip914_g80308;
				float AlphaClipThreshold = 0.5;

				half4 color = half4(BaseColor, Alpha );

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				return color;
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "DepthNormals"
			Tags { "LightMode"="DepthNormals" }

			ZWrite On
			Blend One Zero
			ZTest LEqual
			ZWrite On

			HLSLPROGRAM

			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define ASE_FOG 1
			#define _SPECULAR_SETUP 1
			#pragma multi_compile _ DOTS_INSTANCING_ON
			#define ASE_ABSOLUTE_VERTEX_POS 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140007
			#define ASE_USING_SAMPLING_MACROS 1


			#pragma vertex vert
			#pragma fragment frag

			#pragma multi_compile_fragment _ _WRITE_RENDERING_LAYERS

			#define SHADERPASS SHADERPASS_DEPTHNORMALSONLY

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#if defined(LOD_FADE_CROSSFADE)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
            #endif

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_TANGENT
			#define ASE_NEEDS_FRAG_COLOR
			#define ASE_NEEDS_FRAG_POSITION
			#pragma shader_feature_local_fragment TVE_FEATURE_CLIP
			#pragma shader_feature_local TVE_FEATURE_DETAIL
			#define TVE_IS_PLANT_SHADER
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END
			#define TVE_IS_STANDARD_SHADER
			#define THE_VEGETATION_ENGINE
			#define TVE_IS_UNIVERSAL_PIPELINE


			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE) && (SHADER_TARGET >= 45)
				#define ASE_SV_DEPTH SV_DepthLessEqual
				#define ASE_SV_POSITION_QUALIFIERS linear noperspective centroid
			#else
				#define ASE_SV_DEPTH SV_Depth
				#define ASE_SV_POSITION_QUALIFIERS
			#endif

			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord3 : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				ASE_SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
				float4 clipPosV : TEXCOORD0;
				float3 worldNormal : TEXCOORD1;
				float4 worldTangent : TEXCOORD2;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 positionWS : TEXCOORD3;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					float4 shadowCoord : TEXCOORD4;
				#endif
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
				float4 ase_color : COLOR;
				float4 ase_texcoord7 : TEXCOORD7;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _EmissiveTexRemap;
			half4 _GradientColorOne;
			half4 _GradientColorTwo;
			half4 _VertexOcclusionRemap;
			half4 _DetailBlendRemap;
			half4 _VertexOcclusionColor;
			half4 _vertex_occlusion_mask_mode;
			half4 _SecondUVs;
			float4 _GradientMaskRemap;
			half4 _second_uvs_mode;
			half4 _SecondColorTwo;
			half4 _SecondColor;
			half4 _MainColor;
			half4 _MainColorTwo;
			half4 _motion_mask_mode_20;
			half4 _DetailMeshRemap;
			half4 _SubsurfaceColor;
			float4 _SubsurfaceDiffusion_Asset;
			half4 _detail_mesh_mode;
			half4 _SecondMaskRemap;
			half4 _MainMaskRemap;
			float4 _Color;
			half4 _MainUVs;
			half4 _motion_variation_mode;
			half4 _DetailMaskRemap;
			half4 _motion_mask_mode_30;
			half4 _EmissiveUVs;
			half4 _EmissiveColor;
			half3 _render_normals;
			half _DetailBlendMode;
			half _SecondMaskMinValue;
			half _DetailMaskMode;
			half _SecondColorMode;
			half _SecondMaskMaxValue;
			half _render_cull;
			half _SecondUVsScaleMode;
			half _MainColorMode;
			half _MainMaskMaxValue;
			half _MainMaskMinValue;
			half _MainAlbedoValue;
			half _MotionMaskMode_30;
			half _MotionAmplitude_32;
			float _MotionSpeed_32;
			float _MotionVariation_32;
			float _MotionScale_32;
			half _MotionAmplitude_22;
			half _MotionMaskMode_20;
			half _SecondAlbedoValue;
			half _DetailMaskMinValue;
			half _DetailBlendMinValue;
			half _MainNormalValue;
			half _SecondOcclusionValue;
			half _MainOcclusionValue;
			half _SecondSmoothnessValue;
			half _MainSmoothnessValue;
			half _RenderSpecular;
			float _emissive_intensity_value;
			half _EmissiveTexMaxValue;
			half _EmissiveTexMinValue;
			half _SubsurfaceMaskValue;
			half _SubsurfaceValue;
			half _VertexOcclusionOverlayMode;
			half _OverlayProjectionValue;
			half _SecondNormalValue;
			half _SecondUVsMode;
			half _DetailNormalValue;
			half _GlobalOverlay;
			half _VertexOcclusionMaxValue;
			half _VertexOcclusionMinValue;
			half _VertexOcclusionMaskMode;
			half _GradientMaxValue;
			half _GradientMinValue;
			half _DetailValue;
			half _DetailMode;
			half _DetailBlendMaxValue;
			half _DetailMeshMaxValue;
			half _DetailMeshMinValue;
			half _DetailMeshMode;
			half _DetailMaskMaxValue;
			half _BoundsRadiusValue;
			half _MotionAmplitude_10;
			half _MotionFacingValue;
			half _SubsurfaceDirectValue;
			half _SubsurfaceAmbientValue;
			half _SubsurfaceShadowValue;
			half _IsVersion;
			half _MessageBounds;
			half _SpaceSubsurface;
			half _VertexVariationMode;
			half _HasEmissive;
			half _HasGradient;
			half _IsCustomShader;
			half _IsShared;
			half _IsCollected;
			half _IsIdentifier;
			half _HasOcclusion;
			half _IsTVEShader;
			half _RenderNormals;
			half _RenderMode;
			half _render_src;
			half _render_dst;
			half _render_zw;
			half _render_coverage;
			float _IsPlantShader;
			float _SubsurfaceDiffusion;
			half _SubsurfaceAngleValue;
			half _Cutoff;
			half _RenderSSR;
			half _RenderZWrite;
			half _RenderClip;
			half _RenderCull;
			half _RenderQueue;
			half _RenderPriority;
			half _RenderDecals;
			half _SubsurfaceNormalValue;
			half _SubsurfaceScatteringValue;
			half _MotionValue_30;
			half _EmissiveMode;
			half _IsLiteShader;
			half _DetailSnowMode;
			half _IsStandardShader;
			half _MotionPosition_10;
			float _MotionScale_10;
			half _EmissiveIntensityMode;
			float _MotionSpeed_10;
			half _MotionVariationMode;
			half _BoundsHeightValue;
			half _DetailAlphaMode;
			half _MotionScale_20;
			half _MotionVariation_20;
			half _MotionSpeed_20;
			half _MotionVariation_10;
			half _MotionAmplitude_20;
			half _EmissiveFlagMode;
			half _MessageOcclusion;
			half _MotionValue_20;
			half _MessageMainMask;
			half _MessageSecondMask;
			half _CategoryDetail;
			half _CategorySubsurface;
			half _CategoryEmissive;
			half _EmissiveIntensityValue;
			half _CategoryMotion;
			half _CategoryOcclusion;
			half _CategoryGradient;
			half _CategoryRender;
			half _CategoryMain;
			half _CategoryGlobals;
			half _MessageSubsurface;
			half _CategoryObject;
			half _AlphaClipValue;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);
			TEXTURE2D(_BumpMap);
			SAMPLER(sampler_BumpMap);
			TEXTURE2D(TVE_NoiseTex);
			half TVE_NoiseTexTilling;
			half4 TVE_MotionParams;
			half4 TVE_TimeParams;
			SAMPLER(sampler_Linear_Repeat);
			half4 TVE_WindEditor;
			half TVE_MotionValue_10;
			half TVE_MotionValue_20;
			half TVE_MotionValue_30;
			TEXTURE2D(_MainNormalTex);
			TEXTURE2D(_SecondNormalTex);
			TEXTURE2D(_MainMaskTex);
			TEXTURE2D(_SecondMaskTex);
			half TVE_OverlayNormalValue;
			half TVE_OverlayValue;
			TEXTURE2D(_MainAlbedoTex);
			SAMPLER(sampler_MainAlbedoTex);
			TEXTURE2D(_SecondAlbedoTex);
			SAMPLER(sampler_SecondAlbedoTex);


			
			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float3 VertexPosition3588_g80308 = v.positionOS.xyz;
				half3 Mesh_PivotsOS7730_g80308 = half3(0,0,0);
				float3 temp_output_7738_0_g80308 = ( VertexPosition3588_g80308 - Mesh_PivotsOS7730_g80308 );
				half3 VertexPos40_g80332 = temp_output_7738_0_g80308;
				half3 VertexPos40_g80333 = VertexPos40_g80332;
				float3 appendResult74_g80333 = (float3(VertexPos40_g80333.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g80333 = appendResult74_g80333;
				float3 break84_g80333 = VertexPos40_g80333;
				float3 appendResult81_g80333 = (float3(0.0 , break84_g80333.y , break84_g80333.z));
				half3 VertexPosOtherAxis82_g80333 = appendResult81_g80333;
				float3 ase_worldPos = TransformObjectToWorld( (v.positionOS).xyz );
				float3 vertexToFrag3890_g80308 = ase_worldPos;
				float3 WorldPosition3905_g80308 = vertexToFrag3890_g80308;
				float4x4 break19_g80338 = GetObjectToWorldMatrix();
				float3 appendResult20_g80338 = (float3(break19_g80338[ 0 ][ 3 ] , break19_g80338[ 1 ][ 3 ] , break19_g80338[ 2 ][ 3 ]));
				half3 ObjectData20_g80340 = appendResult20_g80338;
				half3 WorldData19_g80340 = ase_worldPos;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g80340 = WorldData19_g80340;
				#else
				float3 staticSwitch14_g80340 = ObjectData20_g80340;
				#endif
				float3 temp_output_114_0_g80338 = staticSwitch14_g80340;
				float3 vertexToFrag4224_g80308 = temp_output_114_0_g80338;
				float3 ObjectPosition4223_g80308 = vertexToFrag4224_g80308;
				float3 lerpResult7746_g80308 = lerp( WorldPosition3905_g80308 , ObjectPosition4223_g80308 , _MotionPosition_10);
				float3 Motion_10_Position7745_g80308 = lerpResult7746_g80308;
				half3 Input_Position419_g80317 = Motion_10_Position7745_g80308;
				float Input_MotionScale287_g80317 = ( _MotionScale_10 + 0.2 );
				half NoiseTex_Tilling735_g80317 = TVE_NoiseTexTilling;
				float2 temp_output_597_0_g80317 = (( Input_Position419_g80317 * Input_MotionScale287_g80317 * NoiseTex_Tilling735_g80317 * 0.0075 )).xz;
				float2 temp_output_447_0_g80373 = ((TVE_MotionParams).xy*2.0 + -1.0);
				half2 Global_Wind_DirectionWS4683_g80308 = temp_output_447_0_g80373;
				half2 Input_DirectionWS423_g80317 = Global_Wind_DirectionWS4683_g80308;
				float lerpResult128_g80318 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g80317 = _MotionSpeed_10;
				half Input_MotionVariation284_g80317 = _MotionVariation_10;
				half3 Input_Position167_g80354 = ObjectPosition4223_g80308;
				float dotResult156_g80354 = dot( (Input_Position167_g80354).xz , float2( 12.9898,78.233 ) );
				half Input_DynamicMode120_g80354 = 0.0;
				float Postion_Random162_g80354 = ( sin( dotResult156_g80354 ) * ( 1.0 - Input_DynamicMode120_g80354 ) );
				float4 break33_g80386 = _motion_variation_mode;
				float temp_output_30_0_g80386 = ( v.ase_color.r * break33_g80386.x );
				float temp_output_29_0_g80386 = ( v.ase_color.g * break33_g80386.y );
				float temp_output_31_0_g80386 = ( v.ase_color.b * break33_g80386.z );
				float lerpResult7828_g80308 = lerp( 0.0 , ( temp_output_30_0_g80386 + temp_output_29_0_g80386 + temp_output_31_0_g80386 + ( v.ase_color.a * break33_g80386.w ) ) , saturate( _MotionVariationMode ));
				float Mesh_Variation16_g80308 = lerpResult7828_g80308;
				half Input_Variation124_g80354 = Mesh_Variation16_g80308;
				half ObjectData20_g80356 = frac( ( Postion_Random162_g80354 + Input_Variation124_g80354 ) );
				half WorldData19_g80356 = Input_Variation124_g80354;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g80356 = WorldData19_g80356;
				#else
				float staticSwitch14_g80356 = ObjectData20_g80356;
				#endif
				float temp_output_112_0_g80354 = staticSwitch14_g80356;
				float clampResult171_g80354 = clamp( temp_output_112_0_g80354 , 0.01 , 0.99 );
				float Global_MeshVariation7760_g80308 = clampResult171_g80354;
				half Input_GlobalMeshVariation569_g80317 = Global_MeshVariation7760_g80308;
				float temp_output_630_0_g80317 = ( ( ( lerpResult128_g80318 * Input_MotionSpeed62_g80317 ) + ( Input_MotionVariation284_g80317 * Input_GlobalMeshVariation569_g80317 ) ) * 0.03 );
				float temp_output_607_0_g80317 = frac( temp_output_630_0_g80317 );
				float4 lerpResult590_g80317 = lerp( SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g80317 + ( -Input_DirectionWS423_g80317 * temp_output_607_0_g80317 ) ), 0.0 ) , SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g80317 + ( -Input_DirectionWS423_g80317 * frac( ( temp_output_630_0_g80317 + 0.5 ) ) ) ), 0.0 ) , ( abs( ( temp_output_607_0_g80317 - 0.5 ) ) / 0.5 ));
				half4 Noise_Complex703_g80317 = lerpResult590_g80317;
				float2 temp_output_645_0_g80317 = ((Noise_Complex703_g80317).rg*2.0 + -1.0);
				float2 break650_g80317 = temp_output_645_0_g80317;
				float3 appendResult649_g80317 = (float3(break650_g80317.x , 0.0 , break650_g80317.y));
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				half2 Global_Noise_OS5548_g80308 = (( mul( GetWorldToObjectMatrix(), float4( appendResult649_g80317 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_Noise_DirectionOS487_g80347 = Global_Noise_OS5548_g80308;
				float2 break448_g80373 = temp_output_447_0_g80373;
				float3 appendResult452_g80373 = (float3(break448_g80373.x , 0.0 , break448_g80373.y));
				half2 Global_Wind_DirectionOS5692_g80308 = (( mul( GetWorldToObjectMatrix(), float4( appendResult452_g80373 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_Wind_DirectionOS458_g80347 = Global_Wind_DirectionOS5692_g80308;
				float4 break322_g80373 = TVE_MotionParams;
				float lerpResult457_g80373 = lerp( break322_g80373.z , TVE_WindEditor.z , TVE_WindEditor.w);
				float temp_output_459_0_g80373 = ( 1.0 - lerpResult457_g80373 );
				half Global_Wind_Power2223_g80308 = ( 1.0 - ( temp_output_459_0_g80373 * temp_output_459_0_g80373 ) );
				half Input_WindPower449_g80347 = Global_Wind_Power2223_g80308;
				float2 lerpResult516_g80347 = lerp( Input_Noise_DirectionOS487_g80347 , Input_Wind_DirectionOS458_g80347 , ( Input_WindPower449_g80347 * 0.6 ));
				half Mesh_Height1524_g80308 = saturate( ( v.positionOS.xyz.y / _BoundsHeightValue ) );
				half Input_MeshHeight388_g80347 = Mesh_Height1524_g80308;
				half ObjectData20_g80348 = Input_MeshHeight388_g80347;
				half Input_BoundsHeight390_g80347 = 1.0;
				half WorldData19_g80348 = ( Input_MeshHeight388_g80347 * Input_MeshHeight388_g80347 * Input_BoundsHeight390_g80347 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g80348 = WorldData19_g80348;
				#else
				float staticSwitch14_g80348 = ObjectData20_g80348;
				#endif
				half Final_Motion10_Mask321_g80347 = ( staticSwitch14_g80348 * 2.0 );
				half Input_BendingAmplitude376_g80347 = _MotionAmplitude_10;
				half Global_MotionValue640_g80347 = TVE_MotionValue_10;
				half2 Final_Bending631_g80347 = ( lerpResult516_g80347 * ( Final_Motion10_Mask321_g80347 * Input_BendingAmplitude376_g80347 * Input_WindPower449_g80347 * Input_WindPower449_g80347 * Global_MotionValue640_g80347 ) );
				float2 break636_g80347 = Final_Bending631_g80347;
				float3 appendResult637_g80347 = (float3(break636_g80347.x , 0.0 , break636_g80347.y));
				half3 Motion_10_Bending216_g80308 = appendResult637_g80347;
				half3 Angle44_g80332 = Motion_10_Bending216_g80308;
				half Angle44_g80333 = (Angle44_g80332).z;
				half3 VertexPos40_g80334 = ( VertexPosRotationAxis50_g80333 + ( VertexPosOtherAxis82_g80333 * cos( Angle44_g80333 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g80333 ) * sin( Angle44_g80333 ) ) );
				float3 appendResult74_g80334 = (float3(0.0 , 0.0 , VertexPos40_g80334.z));
				half3 VertexPosRotationAxis50_g80334 = appendResult74_g80334;
				float3 break84_g80334 = VertexPos40_g80334;
				float3 appendResult81_g80334 = (float3(break84_g80334.x , break84_g80334.y , 0.0));
				half3 VertexPosOtherAxis82_g80334 = appendResult81_g80334;
				half Angle44_g80334 = -(Angle44_g80332).x;
				half3 Input_Position419_g80359 = WorldPosition3905_g80308;
				float3 break459_g80359 = Input_Position419_g80359;
				float Sum_Position446_g80359 = ( break459_g80359.x + break459_g80359.y + break459_g80359.z );
				half Input_MotionScale321_g80359 = ( _MotionScale_20 * 0.1 );
				half Input_MotionVariation330_g80359 = _MotionVariation_20;
				half Input_GlobalVariation400_g80359 = Global_MeshVariation7760_g80308;
				float lerpResult128_g80360 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g80359 = _MotionSpeed_20;
				float temp_output_404_0_g80359 = ( lerpResult128_g80360 * Input_MotionSpeed62_g80359 );
				half Motion_SineA450_g80359 = sin( ( ( Sum_Position446_g80359 * Input_MotionScale321_g80359 ) + ( Input_MotionVariation330_g80359 * Input_GlobalVariation400_g80359 ) + temp_output_404_0_g80359 ) );
				half Motion_SineB395_g80359 = sin( ( ( temp_output_404_0_g80359 * 0.6842 ) + ( Sum_Position446_g80359 * Input_MotionScale321_g80359 ) ) );
				half3 Input_Position419_g80345 = VertexPosition3588_g80308;
				float3 normalizeResult518_g80345 = normalize( Input_Position419_g80345 );
				half2 Input_DirectionOS423_g80345 = Global_Wind_DirectionOS5692_g80308;
				float2 break521_g80345 = -Input_DirectionOS423_g80345;
				float3 appendResult522_g80345 = (float3(break521_g80345.x , 0.0 , break521_g80345.y));
				float dotResult519_g80345 = dot( normalizeResult518_g80345 , appendResult522_g80345 );
				half Input_Value62_g80345 = _MotionFacingValue;
				float lerpResult524_g80345 = lerp( 1.0 , (dotResult519_g80345*0.5 + 0.5) , Input_Value62_g80345);
				half ObjectData20_g80346 = max( lerpResult524_g80345 , 0.001 );
				half WorldData19_g80346 = 1.0;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g80346 = WorldData19_g80346;
				#else
				float staticSwitch14_g80346 = ObjectData20_g80346;
				#endif
				half Motion_FacingMask7691_g80308 = staticSwitch14_g80346;
				half Motion_20_Amplitude7628_g80308 = Motion_FacingMask7691_g80308;
				half Input_MotionAmplitude384_g80359 = Motion_20_Amplitude7628_g80308;
				half Input_GlobalWind407_g80359 = Global_Wind_Power2223_g80308;
				float4 break638_g80317 = abs( Noise_Complex703_g80317 );
				half Global_Noise_B5526_g80308 = break638_g80317.b;
				half Input_GlobalNoise411_g80359 = Global_Noise_B5526_g80308;
				float lerpResult413_g80359 = lerp( 1.8 , 0.4 , Input_GlobalWind407_g80359);
				half Motion_Amplitude418_g80359 = ( Input_MotionAmplitude384_g80359 * Input_GlobalWind407_g80359 * pow( Input_GlobalNoise411_g80359 , lerpResult413_g80359 ) );
				half Input_Squash58_g80359 = _MotionAmplitude_20;
				float3 appendResult7790_g80308 = (float3(0.0 , v.positionOS.xyz.y , 0.0));
				half Mesh_Spherical7697_g80308 = saturate( ( distance( v.positionOS.xyz , appendResult7790_g80308 ) / _BoundsRadiusValue ) );
				float4 break33_g80370 = _motion_mask_mode_20;
				float temp_output_30_0_g80370 = ( v.ase_color.r * break33_g80370.x );
				float temp_output_29_0_g80370 = ( v.ase_color.g * break33_g80370.y );
				float temp_output_31_0_g80370 = ( v.ase_color.b * break33_g80370.z );
				float lerpResult7813_g80308 = lerp( Mesh_Spherical7697_g80308 , ( temp_output_30_0_g80370 + temp_output_29_0_g80370 + temp_output_31_0_g80370 + ( v.ase_color.a * break33_g80370.w ) ) , saturate( _MotionMaskMode_20 ));
				half Mesh_Motion_207834_g80308 = lerpResult7813_g80308;
				half Input_MeshMotion_20388_g80359 = Mesh_Motion_207834_g80308;
				half Input_BoundsRadius390_g80359 = 1.0;
				half Global_MotionValue462_g80359 = TVE_MotionValue_20;
				half2 Input_DirectionOS366_g80359 = Global_Wind_DirectionOS5692_g80308;
				float2 break371_g80359 = Input_DirectionOS366_g80359;
				float3 appendResult372_g80359 = (float3(break371_g80359.x , ( Motion_SineA450_g80359 * 0.3 ) , break371_g80359.y));
				half3 Motion_20_Squash7632_g80308 = ( ( (max( Motion_SineA450_g80359 , Motion_SineB395_g80359 )*0.5 + 0.5) * Motion_Amplitude418_g80359 * Input_Squash58_g80359 * Input_MeshMotion_20388_g80359 * Input_BoundsRadius390_g80359 * Global_MotionValue462_g80359 ) * appendResult372_g80359 );
				half3 VertexPos40_g80321 = ( ( VertexPosRotationAxis50_g80334 + ( VertexPosOtherAxis82_g80334 * cos( Angle44_g80334 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g80334 ) * sin( Angle44_g80334 ) ) ) + Motion_20_Squash7632_g80308 );
				float3 appendResult74_g80321 = (float3(0.0 , VertexPos40_g80321.y , 0.0));
				float3 VertexPosRotationAxis50_g80321 = appendResult74_g80321;
				float3 break84_g80321 = VertexPos40_g80321;
				float3 appendResult81_g80321 = (float3(break84_g80321.x , 0.0 , break84_g80321.z));
				float3 VertexPosOtherAxis82_g80321 = appendResult81_g80321;
				half Input_Rolling379_g80359 = _MotionAmplitude_22;
				half Motion_20_Rolling7633_g80308 = ( Motion_SineA450_g80359 * Motion_Amplitude418_g80359 * Input_Rolling379_g80359 * Input_MeshMotion_20388_g80359 * Global_MotionValue462_g80359 );
				half Angle44_g80321 = Motion_20_Rolling7633_g80308;
				half3 Input_Position500_g80326 = WorldPosition3905_g80308;
				half Input_MotionScale321_g80326 = _MotionScale_32;
				half Input_MotionVariation330_g80326 = _MotionVariation_32;
				half Input_GlobalVariation372_g80326 = Global_MeshVariation7760_g80308;
				float lerpResult128_g80327 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g80326 = _MotionSpeed_32;
				float4 tex2DNode460_g80326 = SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( ( (Input_Position500_g80326).xz * Input_MotionScale321_g80326 * 0.03 ) + ( Input_MotionVariation330_g80326 * Input_GlobalVariation372_g80326 ) + ( lerpResult128_g80327 * Input_MotionSpeed62_g80326 * 0.02 ) ), 0.0 );
				float3 appendResult462_g80326 = (float3(tex2DNode460_g80326.r , tex2DNode460_g80326.g , tex2DNode460_g80326.b));
				half3 Flutter_Texture489_g80326 = (appendResult462_g80326*2.0 + -1.0);
				half Motion_30_Amplitude7534_g80308 = ( _MotionAmplitude_32 * Motion_FacingMask7691_g80308 );
				half Input_MotionAmplitude58_g80326 = Motion_30_Amplitude7534_g80308;
				float4 break33_g80369 = _motion_mask_mode_30;
				float temp_output_30_0_g80369 = ( v.ase_color.r * break33_g80369.x );
				float temp_output_29_0_g80369 = ( v.ase_color.g * break33_g80369.y );
				float temp_output_31_0_g80369 = ( v.ase_color.b * break33_g80369.z );
				float lerpResult7820_g80308 = lerp( v.ase_texcoord.y , ( temp_output_30_0_g80369 + temp_output_29_0_g80369 + temp_output_31_0_g80369 + ( v.ase_color.a * break33_g80369.w ) ) , saturate( _MotionMaskMode_30 ));
				half Mesh_Motion_30144_g80308 = lerpResult7820_g80308;
				half Input_MeshMotion_30374_g80326 = Mesh_Motion_30144_g80308;
				half Input_GlobalWind471_g80326 = Global_Wind_Power2223_g80308;
				half Global_MotionValue503_g80326 = TVE_MotionValue_30;
				half Input_GlobalNoise472_g80326 = Global_Noise_B5526_g80308;
				float lerpResult466_g80326 = lerp( 2.4 , 0.6 , Input_GlobalWind471_g80326);
				half Flutter_Amplitude491_g80326 = ( Input_MotionAmplitude58_g80326 * Input_MeshMotion_30374_g80326 * Input_GlobalWind471_g80326 * Global_MotionValue503_g80326 * pow( Input_GlobalNoise472_g80326 , lerpResult466_g80326 ) );
				half3 Motion_30_Flutter263_g80308 = ( Flutter_Texture489_g80326 * Flutter_Amplitude491_g80326 );
				float3 Vertex_Motion_Object7655_g80308 = ( ( ( VertexPosRotationAxis50_g80321 + ( VertexPosOtherAxis82_g80321 * cos( Angle44_g80321 ) ) + ( cross( float3(0,1,0) , VertexPosOtherAxis82_g80321 ) * sin( Angle44_g80321 ) ) ) + Motion_30_Flutter263_g80308 ) + Mesh_PivotsOS7730_g80308 );
				float3 Final_VertexPosition890_g80308 = Vertex_Motion_Object7655_g80308;
				
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				float3 ase_worldTangent = TransformObjectToWorldDir(v.tangentOS.xyz);
				float ase_vertexTangentSign = v.tangentOS.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord6.xyz = ase_worldBitangent;
				float4 break33_g80365 = _second_uvs_mode;
				float2 temp_output_30_0_g80365 = ( v.ase_texcoord.xy * break33_g80365.x );
				float2 temp_output_29_0_g80365 = ( v.ase_texcoord3.xy * break33_g80365.y );
				float2 temp_output_31_0_g80365 = ( (WorldPosition3905_g80308).xz * break33_g80365.z );
				half2 Second_UVs_Tilling7781_g80308 = (_SecondUVs).xy;
				half2 Second_UVs_Scale7782_g80308 = ( 1.0 / Second_UVs_Tilling7781_g80308 );
				float2 lerpResult7786_g80308 = lerp( Second_UVs_Tilling7781_g80308 , Second_UVs_Scale7782_g80308 , _SecondUVsScaleMode);
				half2 Second_UVs_Offset7777_g80308 = (_SecondUVs).zw;
				float2 vertexToFrag11_g80309 = ( ( ( temp_output_30_0_g80365 + temp_output_29_0_g80365 + temp_output_31_0_g80365 ) * lerpResult7786_g80308 ) + Second_UVs_Offset7777_g80308 );
				o.ase_texcoord5.zw = vertexToFrag11_g80309;
				
				o.ase_texcoord5.xy = v.ase_texcoord.xy;
				o.ase_color = v.ase_color;
				o.ase_texcoord7 = v.positionOS;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord6.w = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = Final_VertexPosition890_g80308;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.positionOS.xyz = vertexValue;
				#else
					v.positionOS.xyz += vertexValue;
				#endif

				v.normalOS = v.normalOS;
				v.tangentOS = v.tangentOS;

				VertexPositionInputs vertexInput = GetVertexPositionInputs( v.positionOS.xyz );

				float3 normalWS = TransformObjectToWorldNormal( v.normalOS );
				float4 tangentWS = float4( TransformObjectToWorldDir( v.tangentOS.xyz ), v.tangentOS.w );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					o.positionWS = vertexInput.positionWS;
				#endif

				o.worldNormal = normalWS;
				o.worldTangent = tangentWS;

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				o.positionCS = vertexInput.positionCS;
				o.clipPosV = vertexInput.positionCS;
				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord3 : TEXCOORD3;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.positionOS;
				o.normalOS = v.normalOS;
				o.tangentOS = v.tangentOS;
				o.ase_color = v.ase_color;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_texcoord3 = v.ase_texcoord3;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.positionOS = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].vertex.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			void frag(	VertexOutput IN
						, out half4 outNormalWS : SV_Target0
						#ifdef ASE_DEPTH_WRITE_ON
						,out float outputDepth : ASE_SV_DEPTH
						#endif
						#ifdef _WRITE_RENDERING_LAYERS
						, out float4 outRenderingLayers : SV_Target1
						#endif
						, bool ase_vface : SV_IsFrontFace )
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 WorldPosition = IN.positionWS;
				#endif

				float4 ShadowCoords = float4( 0, 0, 0, 0 );
				float3 WorldNormal = IN.worldNormal;
				float4 WorldTangent = IN.worldTangent;

				float4 ClipPos = IN.clipPosV;
				float4 ScreenPos = ComputeScreenPos( IN.clipPosV );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				half2 Main_UVs15_g80308 = ( ( IN.ase_texcoord5.xy * (_MainUVs).xy ) + (_MainUVs).zw );
				half4 Normal_Packed45_g80375 = SAMPLE_TEXTURE2D( _MainNormalTex, sampler_Linear_Repeat, Main_UVs15_g80308 );
				float2 appendResult58_g80375 = (float2(( (Normal_Packed45_g80375).x * (Normal_Packed45_g80375).w ) , (Normal_Packed45_g80375).y));
				half2 Normal_Default50_g80375 = appendResult58_g80375;
				half2 Normal_ASTC41_g80375 = (Normal_Packed45_g80375).xy;
				#ifdef UNITY_ASTC_NORMALMAP_ENCODING
				float2 staticSwitch38_g80375 = Normal_ASTC41_g80375;
				#else
				float2 staticSwitch38_g80375 = Normal_Default50_g80375;
				#endif
				half2 Normal_NO_DTX544_g80375 = (Normal_Packed45_g80375).wy;
				#ifdef UNITY_NO_DXT5nm
				float2 staticSwitch37_g80375 = Normal_NO_DTX544_g80375;
				#else
				float2 staticSwitch37_g80375 = staticSwitch38_g80375;
				#endif
				float2 temp_output_6555_0_g80308 = ( (staticSwitch37_g80375*2.0 + -1.0) * _MainNormalValue );
				half2 Main_Normal137_g80308 = temp_output_6555_0_g80308;
				float2 lerpResult3372_g80308 = lerp( float2( 0,0 ) , Main_Normal137_g80308 , _DetailNormalValue);
				float3 ase_worldBitangent = IN.ase_texcoord6.xyz;
				float3x3 ase_worldToTangent = float3x3(WorldTangent.xyz,ase_worldBitangent,WorldNormal);
				float2 vertexToFrag11_g80309 = IN.ase_texcoord5.zw;
				half2 Second_UVs17_g80308 = vertexToFrag11_g80309;
				half4 Normal_Packed45_g80380 = SAMPLE_TEXTURE2D( _SecondNormalTex, sampler_Linear_Repeat, Second_UVs17_g80308 );
				float2 appendResult58_g80380 = (float2(( (Normal_Packed45_g80380).x * (Normal_Packed45_g80380).w ) , (Normal_Packed45_g80380).y));
				half2 Normal_Default50_g80380 = appendResult58_g80380;
				half2 Normal_ASTC41_g80380 = (Normal_Packed45_g80380).xy;
				#ifdef UNITY_ASTC_NORMALMAP_ENCODING
				float2 staticSwitch38_g80380 = Normal_ASTC41_g80380;
				#else
				float2 staticSwitch38_g80380 = Normal_Default50_g80380;
				#endif
				half2 Normal_NO_DTX544_g80380 = (Normal_Packed45_g80380).wy;
				#ifdef UNITY_NO_DXT5nm
				float2 staticSwitch37_g80380 = Normal_NO_DTX544_g80380;
				#else
				float2 staticSwitch37_g80380 = staticSwitch38_g80380;
				#endif
				float2 temp_output_6560_0_g80308 = ( (staticSwitch37_g80380*2.0 + -1.0) * _SecondNormalValue );
				half2 Normal_Planar45_g80381 = temp_output_6560_0_g80308;
				float2 break64_g80381 = Normal_Planar45_g80381;
				float3 appendResult65_g80381 = (float3(break64_g80381.x , 0.0 , break64_g80381.y));
				float2 temp_output_7775_0_g80308 = (mul( ase_worldToTangent, appendResult65_g80381 )).xy;
				float2 ifLocalVar7776_g80308 = 0;
				if( _SecondUVsMode >= 2.0 )
				ifLocalVar7776_g80308 = temp_output_7775_0_g80308;
				else
				ifLocalVar7776_g80308 = temp_output_6560_0_g80308;
				half2 Second_Normal179_g80308 = ifLocalVar7776_g80308;
				float2 temp_output_36_0_g80312 = ( lerpResult3372_g80308 + Second_Normal179_g80308 );
				float4 tex2DNode35_g80308 = SAMPLE_TEXTURE2D( _MainMaskTex, sampler_Linear_Repeat, Main_UVs15_g80308 );
				half Main_Mask57_g80308 = tex2DNode35_g80308.b;
				float4 tex2DNode33_g80308 = SAMPLE_TEXTURE2D( _SecondMaskTex, sampler_Linear_Repeat, Second_UVs17_g80308 );
				half Second_Mask81_g80308 = tex2DNode33_g80308.b;
				float lerpResult6885_g80308 = lerp( Main_Mask57_g80308 , Second_Mask81_g80308 , _DetailMaskMode);
				float clampResult17_g80325 = clamp( lerpResult6885_g80308 , 0.0001 , 0.9999 );
				float temp_output_7_0_g80324 = _DetailMaskMinValue;
				float temp_output_10_0_g80324 = ( _DetailMaskMaxValue - temp_output_7_0_g80324 );
				half Blend_Mask_Texture6794_g80308 = saturate( ( ( clampResult17_g80325 - temp_output_7_0_g80324 ) / ( temp_output_10_0_g80324 + 0.0001 ) ) );
				float3 appendResult7388_g80308 = (float3(temp_output_6555_0_g80308 , 1.0));
				float3 tanToWorld0 = float3( WorldTangent.xyz.x, ase_worldBitangent.x, WorldNormal.x );
				float3 tanToWorld1 = float3( WorldTangent.xyz.y, ase_worldBitangent.y, WorldNormal.y );
				float3 tanToWorld2 = float3( WorldTangent.xyz.z, ase_worldBitangent.z, WorldNormal.z );
				float3 tanNormal7389_g80308 = appendResult7388_g80308;
				float3 worldNormal7389_g80308 = float3(dot(tanToWorld0,tanNormal7389_g80308), dot(tanToWorld1,tanNormal7389_g80308), dot(tanToWorld2,tanNormal7389_g80308));
				half3 Main_NormalWS7390_g80308 = worldNormal7389_g80308;
				float4 break33_g80385 = _detail_mesh_mode;
				float temp_output_30_0_g80385 = ( IN.ase_color.r * break33_g80385.x );
				float temp_output_29_0_g80385 = ( IN.ase_color.g * break33_g80385.y );
				float temp_output_31_0_g80385 = ( IN.ase_color.b * break33_g80385.z );
				float lerpResult7836_g80308 = lerp( ((Main_NormalWS7390_g80308).y*0.5 + 0.5) , ( temp_output_30_0_g80385 + temp_output_29_0_g80385 + temp_output_31_0_g80385 + ( IN.ase_color.a * break33_g80385.w ) ) , saturate( _DetailMeshMode ));
				float clampResult17_g80323 = clamp( lerpResult7836_g80308 , 0.0001 , 0.9999 );
				float temp_output_7_0_g80322 = _DetailMeshMinValue;
				float temp_output_10_0_g80322 = ( _DetailMeshMaxValue - temp_output_7_0_g80322 );
				half Blend_Mask_Mesh1540_g80308 = saturate( ( ( clampResult17_g80323 - temp_output_7_0_g80322 ) / ( temp_output_10_0_g80322 + 0.0001 ) ) );
				float clampResult17_g80352 = clamp( ( Blend_Mask_Texture6794_g80308 * Blend_Mask_Mesh1540_g80308 ) , 0.0001 , 0.9999 );
				float temp_output_7_0_g80353 = _DetailBlendMinValue;
				float temp_output_10_0_g80353 = ( _DetailBlendMaxValue - temp_output_7_0_g80353 );
				half Blend_Mask147_g80308 = ( saturate( ( ( clampResult17_g80352 - temp_output_7_0_g80353 ) / ( temp_output_10_0_g80353 + 0.0001 ) ) ) * _DetailMode * _DetailValue );
				float2 lerpResult3376_g80308 = lerp( Main_Normal137_g80308 , temp_output_36_0_g80312 , Blend_Mask147_g80308);
				#ifdef TVE_FEATURE_DETAIL
				float2 staticSwitch267_g80308 = lerpResult3376_g80308;
				#else
				float2 staticSwitch267_g80308 = Main_Normal137_g80308;
				#endif
				half2 Blend_Normal312_g80308 = staticSwitch267_g80308;
				half Global_OverlayNormalScale6581_g80308 = TVE_OverlayNormalValue;
				half Global_OverlayIntensity154_g80308 = TVE_OverlayValue;
				half Overlay_Value5738_g80308 = ( _GlobalOverlay * Global_OverlayIntensity154_g80308 );
				float3 appendResult7377_g80308 = (float3(Blend_Normal312_g80308 , 1.0));
				float3 tanNormal7376_g80308 = appendResult7377_g80308;
				float3 worldNormal7376_g80308 = float3(dot(tanToWorld0,tanNormal7376_g80308), dot(tanToWorld1,tanNormal7376_g80308), dot(tanToWorld2,tanNormal7376_g80308));
				half3 Blend_NormalWS7375_g80308 = worldNormal7376_g80308;
				float lerpResult7510_g80308 = lerp( 1.0 , saturate( (Blend_NormalWS7375_g80308).y ) , _OverlayProjectionValue);
				half Overlay_Projection6081_g80308 = lerpResult7510_g80308;
				float4 tex2DNode29_g80308 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs15_g80308 );
				float3 lerpResult6223_g80308 = lerp( float3( 1,1,1 ) , (tex2DNode29_g80308).rgb , _MainAlbedoValue);
				float clampResult17_g80376 = clamp( Main_Mask57_g80308 , 0.0001 , 0.9999 );
				float temp_output_7_0_g80377 = _MainMaskMinValue;
				float temp_output_10_0_g80377 = ( _MainMaskMaxValue - temp_output_7_0_g80377 );
				half Main_Mask_Remap5765_g80308 = saturate( ( ( clampResult17_g80376 - temp_output_7_0_g80377 ) / ( temp_output_10_0_g80377 + 0.0001 ) ) );
				float lerpResult7896_g80308 = lerp( 1.0 , Main_Mask_Remap5765_g80308 , _MainColorMode);
				float4 lerpResult7876_g80308 = lerp( _MainColorTwo , _MainColor , lerpResult7896_g80308);
				half3 Main_Color_RGB7884_g80308 = (lerpResult7876_g80308).rgb;
				half3 Main_Albedo99_g80308 = ( lerpResult6223_g80308 * Main_Color_RGB7884_g80308 );
				float4 tex2DNode89_g80308 = SAMPLE_TEXTURE2D( _SecondAlbedoTex, sampler_SecondAlbedoTex, Second_UVs17_g80308 );
				float3 lerpResult6225_g80308 = lerp( float3( 1,1,1 ) , (tex2DNode89_g80308).rgb , _SecondAlbedoValue);
				float clampResult17_g80378 = clamp( Second_Mask81_g80308 , 0.0001 , 0.9999 );
				float temp_output_7_0_g80379 = _SecondMaskMinValue;
				float temp_output_10_0_g80379 = ( _SecondMaskMaxValue - temp_output_7_0_g80379 );
				half Second_Mask_Remap6130_g80308 = saturate( ( ( clampResult17_g80378 - temp_output_7_0_g80379 ) / ( temp_output_10_0_g80379 + 0.0001 ) ) );
				float lerpResult7897_g80308 = lerp( 1.0 , Second_Mask_Remap6130_g80308 , _SecondColorMode);
				float4 lerpResult7886_g80308 = lerp( _SecondColorTwo , _SecondColor , lerpResult7897_g80308);
				half3 Second_Color_RGB7894_g80308 = (lerpResult7886_g80308).rgb;
				half3 Second_Albedo153_g80308 = ( lerpResult6225_g80308 * Second_Color_RGB7894_g80308 );
				#ifdef UNITY_COLORSPACE_GAMMA
				float staticSwitch1_g80311 = 2.0;
				#else
				float staticSwitch1_g80311 = 4.594794;
				#endif
				float3 lerpResult4834_g80308 = lerp( ( Main_Albedo99_g80308 * Second_Albedo153_g80308 * staticSwitch1_g80311 ) , Second_Albedo153_g80308 , _DetailBlendMode);
				float3 lerpResult235_g80308 = lerp( Main_Albedo99_g80308 , lerpResult4834_g80308 , Blend_Mask147_g80308);
				#ifdef TVE_FEATURE_DETAIL
				float3 staticSwitch255_g80308 = lerpResult235_g80308;
				#else
				float3 staticSwitch255_g80308 = Main_Albedo99_g80308;
				#endif
				half3 Blend_Albedo265_g80308 = staticSwitch255_g80308;
				half Mesh_Height1524_g80308 = saturate( ( IN.ase_texcoord7.xyz.y / _BoundsHeightValue ) );
				float temp_output_7_0_g80367 = _GradientMinValue;
				float temp_output_10_0_g80367 = ( _GradientMaxValue - temp_output_7_0_g80367 );
				half Gradient_Value2784_g80308 = saturate( ( ( Mesh_Height1524_g80308 - temp_output_7_0_g80367 ) / ( temp_output_10_0_g80367 + 0.0001 ) ) );
				float3 lerpResult2779_g80308 = lerp( (_GradientColorTwo).rgb , (_GradientColorOne).rgb , Gradient_Value2784_g80308);
				float lerpResult6617_g80308 = lerp( Main_Mask_Remap5765_g80308 , Second_Mask_Remap6130_g80308 , Blend_Mask147_g80308);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch6623_g80308 = lerpResult6617_g80308;
				#else
				float staticSwitch6623_g80308 = Main_Mask_Remap5765_g80308;
				#endif
				half Blend_Mask_Remap6621_g80308 = staticSwitch6623_g80308;
				half Gradient_Mask6207_g80308 = Blend_Mask_Remap6621_g80308;
				float3 lerpResult6208_g80308 = lerp( float3( 1,1,1 ) , lerpResult2779_g80308 , Gradient_Mask6207_g80308);
				half3 Tint_Gradient_Color5769_g80308 = lerpResult6208_g80308;
				float3 temp_output_3_0_g80316 = ( Blend_Albedo265_g80308 * Tint_Gradient_Color5769_g80308 );
				float dotResult20_g80316 = dot( temp_output_3_0_g80316 , float3(0.2126,0.7152,0.0722) );
				float clampResult6740_g80308 = clamp( saturate( ( dotResult20_g80316 * 5.0 ) ) , 0.2 , 1.0 );
				half Blend_Albedo_Globals6410_g80308 = clampResult6740_g80308;
				half Overlay_Shading6688_g80308 = Blend_Albedo_Globals6410_g80308;
				half Occlusion_Alpha6463_g80308 = _VertexOcclusionColor.a;
				float3 appendResult7790_g80308 = (float3(0.0 , IN.ase_texcoord7.xyz.y , 0.0));
				half Mesh_Spherical7697_g80308 = saturate( ( distance( IN.ase_texcoord7.xyz , appendResult7790_g80308 ) / _BoundsRadiusValue ) );
				float4 break33_g80384 = _vertex_occlusion_mask_mode;
				float temp_output_30_0_g80384 = ( IN.ase_color.r * break33_g80384.x );
				float temp_output_29_0_g80384 = ( IN.ase_color.g * break33_g80384.y );
				float temp_output_31_0_g80384 = ( IN.ase_color.b * break33_g80384.z );
				float lerpResult7809_g80308 = lerp( Mesh_Spherical7697_g80308 , ( temp_output_30_0_g80384 + temp_output_29_0_g80384 + temp_output_31_0_g80384 + ( IN.ase_color.a * break33_g80384.w ) ) , saturate( _VertexOcclusionMaskMode ));
				float clampResult17_g80371 = clamp( lerpResult7809_g80308 , 0.0001 , 0.9999 );
				float temp_output_7_0_g80366 = _VertexOcclusionMinValue;
				float temp_output_10_0_g80366 = ( _VertexOcclusionMaxValue - temp_output_7_0_g80366 );
				half Occlusion_Mask6432_g80308 = saturate( ( ( clampResult17_g80371 - temp_output_7_0_g80366 ) / ( temp_output_10_0_g80366 + 0.0001 ) ) );
				float lerpResult7923_g80308 = lerp( Occlusion_Mask6432_g80308 , ( 1.0 - Occlusion_Mask6432_g80308 ) , _VertexOcclusionOverlayMode);
				float lerpResult7921_g80308 = lerp( Occlusion_Alpha6463_g80308 , 1.0 , lerpResult7923_g80308);
				half Occlusion_Overlay6471_g80308 = lerpResult7921_g80308;
				half Overlay_Variation4560_g80308 = 1.0;
				float temp_output_7_0_g80313 = 0.1;
				float temp_output_10_0_g80313 = ( 0.2 - temp_output_7_0_g80313 );
				half Overlay_Mask269_g80308 = saturate( ( ( ( Overlay_Value5738_g80308 * Overlay_Projection6081_g80308 * Overlay_Shading6688_g80308 * Occlusion_Overlay6471_g80308 * Overlay_Variation4560_g80308 ) - temp_output_7_0_g80313 ) / ( temp_output_10_0_g80313 + 0.0001 ) ) );
				float lerpResult6585_g80308 = lerp( 1.0 , Global_OverlayNormalScale6581_g80308 , Overlay_Mask269_g80308);
				half2 Blend_Normal_Overlay366_g80308 = ( Blend_Normal312_g80308 * lerpResult6585_g80308 );
				float3 appendResult6568_g80308 = (float3(Blend_Normal_Overlay366_g80308 , 1.0));
				float3 temp_output_13_0_g80310 = appendResult6568_g80308;
				float3 temp_output_33_0_g80310 = ( temp_output_13_0_g80310 * _render_normals );
				float3 switchResult12_g80310 = (((ase_vface>0)?(temp_output_13_0_g80310):(temp_output_33_0_g80310)));
				
				float localCustomAlphaClip19_g80314 = ( 0.0 );
				half Main_Alpha316_g80308 = tex2DNode29_g80308.a;
				half Second_Alpha5007_g80308 = tex2DNode89_g80308.a;
				float lerpResult6153_g80308 = lerp( Main_Alpha316_g80308 , Second_Alpha5007_g80308 , Blend_Mask147_g80308);
				float lerpResult6785_g80308 = lerp( ( Main_Alpha316_g80308 * Second_Alpha5007_g80308 ) , lerpResult6153_g80308 , _DetailAlphaMode);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch6158_g80308 = lerpResult6785_g80308;
				#else
				float staticSwitch6158_g80308 = Main_Alpha316_g80308;
				#endif
				half Blend_Alpha6157_g80308 = staticSwitch6158_g80308;
				half AlphaTreshold2132_g80308 = _AlphaClipValue;
				float temp_output_3_0_g80314 = ( Blend_Alpha6157_g80308 - AlphaTreshold2132_g80308 );
				float Alpha19_g80314 = temp_output_3_0_g80314;
				float temp_output_15_0_g80314 = 0.01;
				float Treshold19_g80314 = temp_output_15_0_g80314;
				{
				#if defined (TVE_FEATURE_CLIP)
				#if defined (TVE_IS_HD_PIPELINE)
				#if !defined(SHADERPASS_FORWARD_BYPASS_ALPHA_TEST) && !defined(SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST)
				clip(Alpha19_g80314 - Treshold19_g80314);
				#endif
				#else
				clip(Alpha19_g80314 - Treshold19_g80314);
				#endif
				#endif
				}
				half Final_Clip914_g80308 = Alpha19_g80314;
				

				float3 Normal = switchResult12_g80310;
				float Alpha = Final_Clip914_g80308;
				float AlphaClipThreshold = 0.5;
				#ifdef ASE_DEPTH_WRITE_ON
					float DepthValue = IN.positionCS.z;
				#endif

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				#ifdef LOD_FADE_CROSSFADE
					LODFadeCrossFade( IN.positionCS );
				#endif

				#ifdef ASE_DEPTH_WRITE_ON
					outputDepth = DepthValue;
				#endif

				#if defined(_GBUFFER_NORMALS_OCT)
					float2 octNormalWS = PackNormalOctQuadEncode(WorldNormal);
					float2 remappedOctNormalWS = saturate(octNormalWS * 0.5 + 0.5);
					half3 packedNormalWS = PackFloat2To888(remappedOctNormalWS);
					outNormalWS = half4(packedNormalWS, 0.0);
				#else
					#if defined(_NORMALMAP)
						#if _NORMAL_DROPOFF_TS
							float crossSign = (WorldTangent.w > 0.0 ? 1.0 : -1.0) * GetOddNegativeScale();
							float3 bitangent = crossSign * cross(WorldNormal.xyz, WorldTangent.xyz);
							float3 normalWS = TransformTangentToWorld(Normal, half3x3(WorldTangent.xyz, bitangent, WorldNormal.xyz));
						#elif _NORMAL_DROPOFF_OS
							float3 normalWS = TransformObjectToWorldNormal(Normal);
						#elif _NORMAL_DROPOFF_WS
							float3 normalWS = Normal;
						#endif
					#else
						float3 normalWS = WorldNormal;
					#endif
					outNormalWS = half4(NormalizeNormalPerPixel(normalWS), 0.0);
				#endif

				#ifdef _WRITE_RENDERING_LAYERS
					uint renderingLayers = GetMeshRenderingLayer();
					outRenderingLayers = float4( EncodeMeshRenderingLayer( renderingLayers ), 0, 0, 0 );
				#endif
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "GBuffer"
			Tags { "LightMode"="UniversalGBuffer" }

			Blend [_render_src] [_render_dst], One Zero
			ZWrite On
			ZTest LEqual
			Offset 0 , 0
			ColorMask RGBA
			

			HLSLPROGRAM

			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define _SPECULAR_SETUP 1
			#pragma multi_compile _ DOTS_INSTANCING_ON
			#define ASE_ABSOLUTE_VERTEX_POS 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140007
			#define ASE_USING_SAMPLING_MACROS 1


			//#pragma shader_feature_local _RECEIVE_SHADOWS_OFF
			//#pragma shader_feature_local_fragment _SPECULARHIGHLIGHTS_OFF
			//#pragma shader_feature_local_fragment _ENVIRONMENTREFLECTIONS_OFF

			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS _MAIN_LIGHT_SHADOWS_CASCADE _MAIN_LIGHT_SHADOWS_SCREEN
			#pragma multi_compile_fragment _ _REFLECTION_PROBE_BLENDING
			#pragma multi_compile_fragment _ _REFLECTION_PROBE_BOX_PROJECTION
			#pragma multi_compile_fragment _ _SHADOWS_SOFT _SHADOWS_SOFT_LOW _SHADOWS_SOFT_MEDIUM _SHADOWS_SOFT_HIGH
			#pragma multi_compile_fragment _ _DBUFFER_MRT1 _DBUFFER_MRT2 _DBUFFER_MRT3
			#pragma multi_compile_fragment _ _RENDER_PASS_ENABLED

			#pragma multi_compile _ LIGHTMAP_SHADOW_MIXING
			#pragma multi_compile _ SHADOWS_SHADOWMASK
			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
			#pragma multi_compile _ LIGHTMAP_ON
			#pragma multi_compile _ DYNAMICLIGHTMAP_ON
			#pragma multi_compile_fragment _ _GBUFFER_NORMALS_OCT
			#pragma multi_compile_fragment _ _WRITE_RENDERING_LAYERS

			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS SHADERPASS_GBUFFER

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Shadows.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DBuffer.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#if defined(LOD_FADE_CROSSFADE)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
            #endif
			
			#if defined(UNITY_INSTANCING_ENABLED) && defined(_TERRAIN_INSTANCED_PERPIXEL_NORMAL)
				#define ENABLE_TERRAIN_PERPIXEL_NORMAL
			#endif

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_BITANGENT
			#define ASE_NEEDS_FRAG_COLOR
			#define ASE_NEEDS_FRAG_POSITION
			#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR
			#pragma shader_feature_local_fragment TVE_FEATURE_CLIP
			#pragma shader_feature_local TVE_FEATURE_DETAIL
			#pragma shader_feature_local_fragment TVE_FEATURE_EMISSIVE
			#define TVE_IS_PLANT_SHADER
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END
			#define TVE_IS_STANDARD_SHADER
			#define THE_VEGETATION_ENGINE
			#define TVE_IS_UNIVERSAL_PIPELINE


			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE) && (SHADER_TARGET >= 45)
				#define ASE_SV_DEPTH SV_DepthLessEqual
				#define ASE_SV_POSITION_QUALIFIERS linear noperspective centroid
			#else
				#define ASE_SV_DEPTH SV_Depth
				#define ASE_SV_POSITION_QUALIFIERS
			#endif

			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 texcoord : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_color : COLOR;
				float4 ase_texcoord3 : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				ASE_SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
				float4 clipPosV : TEXCOORD0;
				float4 lightmapUVOrVertexSH : TEXCOORD1;
				half4 fogFactorAndVertexLight : TEXCOORD2;
				float4 tSpace0 : TEXCOORD3;
				float4 tSpace1 : TEXCOORD4;
				float4 tSpace2 : TEXCOORD5;
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
				float4 shadowCoord : TEXCOORD6;
				#endif
				#if defined(DYNAMICLIGHTMAP_ON)
				float2 dynamicLightmapUV : TEXCOORD7;
				#endif
				float4 ase_texcoord8 : TEXCOORD8;
				float4 ase_color : COLOR;
				float4 ase_texcoord9 : TEXCOORD9;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _EmissiveTexRemap;
			half4 _GradientColorOne;
			half4 _GradientColorTwo;
			half4 _VertexOcclusionRemap;
			half4 _DetailBlendRemap;
			half4 _VertexOcclusionColor;
			half4 _vertex_occlusion_mask_mode;
			half4 _SecondUVs;
			float4 _GradientMaskRemap;
			half4 _second_uvs_mode;
			half4 _SecondColorTwo;
			half4 _SecondColor;
			half4 _MainColor;
			half4 _MainColorTwo;
			half4 _motion_mask_mode_20;
			half4 _DetailMeshRemap;
			half4 _SubsurfaceColor;
			float4 _SubsurfaceDiffusion_Asset;
			half4 _detail_mesh_mode;
			half4 _SecondMaskRemap;
			half4 _MainMaskRemap;
			float4 _Color;
			half4 _MainUVs;
			half4 _motion_variation_mode;
			half4 _DetailMaskRemap;
			half4 _motion_mask_mode_30;
			half4 _EmissiveUVs;
			half4 _EmissiveColor;
			half3 _render_normals;
			half _DetailBlendMode;
			half _SecondMaskMinValue;
			half _DetailMaskMode;
			half _SecondColorMode;
			half _SecondMaskMaxValue;
			half _render_cull;
			half _SecondUVsScaleMode;
			half _MainColorMode;
			half _MainMaskMaxValue;
			half _MainMaskMinValue;
			half _MainAlbedoValue;
			half _MotionMaskMode_30;
			half _MotionAmplitude_32;
			float _MotionSpeed_32;
			float _MotionVariation_32;
			float _MotionScale_32;
			half _MotionAmplitude_22;
			half _MotionMaskMode_20;
			half _SecondAlbedoValue;
			half _DetailMaskMinValue;
			half _DetailBlendMinValue;
			half _MainNormalValue;
			half _SecondOcclusionValue;
			half _MainOcclusionValue;
			half _SecondSmoothnessValue;
			half _MainSmoothnessValue;
			half _RenderSpecular;
			float _emissive_intensity_value;
			half _EmissiveTexMaxValue;
			half _EmissiveTexMinValue;
			half _SubsurfaceMaskValue;
			half _SubsurfaceValue;
			half _VertexOcclusionOverlayMode;
			half _OverlayProjectionValue;
			half _SecondNormalValue;
			half _SecondUVsMode;
			half _DetailNormalValue;
			half _GlobalOverlay;
			half _VertexOcclusionMaxValue;
			half _VertexOcclusionMinValue;
			half _VertexOcclusionMaskMode;
			half _GradientMaxValue;
			half _GradientMinValue;
			half _DetailValue;
			half _DetailMode;
			half _DetailBlendMaxValue;
			half _DetailMeshMaxValue;
			half _DetailMeshMinValue;
			half _DetailMeshMode;
			half _DetailMaskMaxValue;
			half _BoundsRadiusValue;
			half _MotionAmplitude_10;
			half _MotionFacingValue;
			half _SubsurfaceDirectValue;
			half _SubsurfaceAmbientValue;
			half _SubsurfaceShadowValue;
			half _IsVersion;
			half _MessageBounds;
			half _SpaceSubsurface;
			half _VertexVariationMode;
			half _HasEmissive;
			half _HasGradient;
			half _IsCustomShader;
			half _IsShared;
			half _IsCollected;
			half _IsIdentifier;
			half _HasOcclusion;
			half _IsTVEShader;
			half _RenderNormals;
			half _RenderMode;
			half _render_src;
			half _render_dst;
			half _render_zw;
			half _render_coverage;
			float _IsPlantShader;
			float _SubsurfaceDiffusion;
			half _SubsurfaceAngleValue;
			half _Cutoff;
			half _RenderSSR;
			half _RenderZWrite;
			half _RenderClip;
			half _RenderCull;
			half _RenderQueue;
			half _RenderPriority;
			half _RenderDecals;
			half _SubsurfaceNormalValue;
			half _SubsurfaceScatteringValue;
			half _MotionValue_30;
			half _EmissiveMode;
			half _IsLiteShader;
			half _DetailSnowMode;
			half _IsStandardShader;
			half _MotionPosition_10;
			float _MotionScale_10;
			half _EmissiveIntensityMode;
			float _MotionSpeed_10;
			half _MotionVariationMode;
			half _BoundsHeightValue;
			half _DetailAlphaMode;
			half _MotionScale_20;
			half _MotionVariation_20;
			half _MotionSpeed_20;
			half _MotionVariation_10;
			half _MotionAmplitude_20;
			half _EmissiveFlagMode;
			half _MessageOcclusion;
			half _MotionValue_20;
			half _MessageMainMask;
			half _MessageSecondMask;
			half _CategoryDetail;
			half _CategorySubsurface;
			half _CategoryEmissive;
			half _EmissiveIntensityValue;
			half _CategoryMotion;
			half _CategoryOcclusion;
			half _CategoryGradient;
			half _CategoryRender;
			half _CategoryMain;
			half _CategoryGlobals;
			half _MessageSubsurface;
			half _CategoryObject;
			half _AlphaClipValue;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);
			TEXTURE2D(_BumpMap);
			SAMPLER(sampler_BumpMap);
			TEXTURE2D(TVE_NoiseTex);
			half TVE_NoiseTexTilling;
			half4 TVE_MotionParams;
			half4 TVE_TimeParams;
			SAMPLER(sampler_Linear_Repeat);
			half4 TVE_WindEditor;
			half TVE_MotionValue_10;
			half TVE_MotionValue_20;
			half TVE_MotionValue_30;
			TEXTURE2D(_MainAlbedoTex);
			SAMPLER(sampler_MainAlbedoTex);
			TEXTURE2D(_MainMaskTex);
			TEXTURE2D(_SecondAlbedoTex);
			SAMPLER(sampler_SecondAlbedoTex);
			TEXTURE2D(_SecondMaskTex);
			TEXTURE2D(_MainNormalTex);
			half4 TVE_OverlayColor;
			half TVE_OverlayValue;
			TEXTURE2D(_SecondNormalTex);
			half TVE_SubsurfaceValue;
			half TVE_OverlaySubsurface;
			half3 TVE_MainLightDirection;
			half TVE_OverlayNormalValue;
			TEXTURE2D(_EmissiveTex);
			half TVE_OverlaySmoothness;


			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/UnityGBuffer.hlsl"

			
			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float3 VertexPosition3588_g80308 = v.positionOS.xyz;
				half3 Mesh_PivotsOS7730_g80308 = half3(0,0,0);
				float3 temp_output_7738_0_g80308 = ( VertexPosition3588_g80308 - Mesh_PivotsOS7730_g80308 );
				half3 VertexPos40_g80332 = temp_output_7738_0_g80308;
				half3 VertexPos40_g80333 = VertexPos40_g80332;
				float3 appendResult74_g80333 = (float3(VertexPos40_g80333.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g80333 = appendResult74_g80333;
				float3 break84_g80333 = VertexPos40_g80333;
				float3 appendResult81_g80333 = (float3(0.0 , break84_g80333.y , break84_g80333.z));
				half3 VertexPosOtherAxis82_g80333 = appendResult81_g80333;
				float3 ase_worldPos = TransformObjectToWorld( (v.positionOS).xyz );
				float3 vertexToFrag3890_g80308 = ase_worldPos;
				float3 WorldPosition3905_g80308 = vertexToFrag3890_g80308;
				float4x4 break19_g80338 = GetObjectToWorldMatrix();
				float3 appendResult20_g80338 = (float3(break19_g80338[ 0 ][ 3 ] , break19_g80338[ 1 ][ 3 ] , break19_g80338[ 2 ][ 3 ]));
				half3 ObjectData20_g80340 = appendResult20_g80338;
				half3 WorldData19_g80340 = ase_worldPos;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g80340 = WorldData19_g80340;
				#else
				float3 staticSwitch14_g80340 = ObjectData20_g80340;
				#endif
				float3 temp_output_114_0_g80338 = staticSwitch14_g80340;
				float3 vertexToFrag4224_g80308 = temp_output_114_0_g80338;
				float3 ObjectPosition4223_g80308 = vertexToFrag4224_g80308;
				float3 lerpResult7746_g80308 = lerp( WorldPosition3905_g80308 , ObjectPosition4223_g80308 , _MotionPosition_10);
				float3 Motion_10_Position7745_g80308 = lerpResult7746_g80308;
				half3 Input_Position419_g80317 = Motion_10_Position7745_g80308;
				float Input_MotionScale287_g80317 = ( _MotionScale_10 + 0.2 );
				half NoiseTex_Tilling735_g80317 = TVE_NoiseTexTilling;
				float2 temp_output_597_0_g80317 = (( Input_Position419_g80317 * Input_MotionScale287_g80317 * NoiseTex_Tilling735_g80317 * 0.0075 )).xz;
				float2 temp_output_447_0_g80373 = ((TVE_MotionParams).xy*2.0 + -1.0);
				half2 Global_Wind_DirectionWS4683_g80308 = temp_output_447_0_g80373;
				half2 Input_DirectionWS423_g80317 = Global_Wind_DirectionWS4683_g80308;
				float lerpResult128_g80318 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g80317 = _MotionSpeed_10;
				half Input_MotionVariation284_g80317 = _MotionVariation_10;
				half3 Input_Position167_g80354 = ObjectPosition4223_g80308;
				float dotResult156_g80354 = dot( (Input_Position167_g80354).xz , float2( 12.9898,78.233 ) );
				half Input_DynamicMode120_g80354 = 0.0;
				float Postion_Random162_g80354 = ( sin( dotResult156_g80354 ) * ( 1.0 - Input_DynamicMode120_g80354 ) );
				float4 break33_g80386 = _motion_variation_mode;
				float temp_output_30_0_g80386 = ( v.ase_color.r * break33_g80386.x );
				float temp_output_29_0_g80386 = ( v.ase_color.g * break33_g80386.y );
				float temp_output_31_0_g80386 = ( v.ase_color.b * break33_g80386.z );
				float lerpResult7828_g80308 = lerp( 0.0 , ( temp_output_30_0_g80386 + temp_output_29_0_g80386 + temp_output_31_0_g80386 + ( v.ase_color.a * break33_g80386.w ) ) , saturate( _MotionVariationMode ));
				float Mesh_Variation16_g80308 = lerpResult7828_g80308;
				half Input_Variation124_g80354 = Mesh_Variation16_g80308;
				half ObjectData20_g80356 = frac( ( Postion_Random162_g80354 + Input_Variation124_g80354 ) );
				half WorldData19_g80356 = Input_Variation124_g80354;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g80356 = WorldData19_g80356;
				#else
				float staticSwitch14_g80356 = ObjectData20_g80356;
				#endif
				float temp_output_112_0_g80354 = staticSwitch14_g80356;
				float clampResult171_g80354 = clamp( temp_output_112_0_g80354 , 0.01 , 0.99 );
				float Global_MeshVariation7760_g80308 = clampResult171_g80354;
				half Input_GlobalMeshVariation569_g80317 = Global_MeshVariation7760_g80308;
				float temp_output_630_0_g80317 = ( ( ( lerpResult128_g80318 * Input_MotionSpeed62_g80317 ) + ( Input_MotionVariation284_g80317 * Input_GlobalMeshVariation569_g80317 ) ) * 0.03 );
				float temp_output_607_0_g80317 = frac( temp_output_630_0_g80317 );
				float4 lerpResult590_g80317 = lerp( SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g80317 + ( -Input_DirectionWS423_g80317 * temp_output_607_0_g80317 ) ), 0.0 ) , SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g80317 + ( -Input_DirectionWS423_g80317 * frac( ( temp_output_630_0_g80317 + 0.5 ) ) ) ), 0.0 ) , ( abs( ( temp_output_607_0_g80317 - 0.5 ) ) / 0.5 ));
				half4 Noise_Complex703_g80317 = lerpResult590_g80317;
				float2 temp_output_645_0_g80317 = ((Noise_Complex703_g80317).rg*2.0 + -1.0);
				float2 break650_g80317 = temp_output_645_0_g80317;
				float3 appendResult649_g80317 = (float3(break650_g80317.x , 0.0 , break650_g80317.y));
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				half2 Global_Noise_OS5548_g80308 = (( mul( GetWorldToObjectMatrix(), float4( appendResult649_g80317 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_Noise_DirectionOS487_g80347 = Global_Noise_OS5548_g80308;
				float2 break448_g80373 = temp_output_447_0_g80373;
				float3 appendResult452_g80373 = (float3(break448_g80373.x , 0.0 , break448_g80373.y));
				half2 Global_Wind_DirectionOS5692_g80308 = (( mul( GetWorldToObjectMatrix(), float4( appendResult452_g80373 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_Wind_DirectionOS458_g80347 = Global_Wind_DirectionOS5692_g80308;
				float4 break322_g80373 = TVE_MotionParams;
				float lerpResult457_g80373 = lerp( break322_g80373.z , TVE_WindEditor.z , TVE_WindEditor.w);
				float temp_output_459_0_g80373 = ( 1.0 - lerpResult457_g80373 );
				half Global_Wind_Power2223_g80308 = ( 1.0 - ( temp_output_459_0_g80373 * temp_output_459_0_g80373 ) );
				half Input_WindPower449_g80347 = Global_Wind_Power2223_g80308;
				float2 lerpResult516_g80347 = lerp( Input_Noise_DirectionOS487_g80347 , Input_Wind_DirectionOS458_g80347 , ( Input_WindPower449_g80347 * 0.6 ));
				half Mesh_Height1524_g80308 = saturate( ( v.positionOS.xyz.y / _BoundsHeightValue ) );
				half Input_MeshHeight388_g80347 = Mesh_Height1524_g80308;
				half ObjectData20_g80348 = Input_MeshHeight388_g80347;
				half Input_BoundsHeight390_g80347 = 1.0;
				half WorldData19_g80348 = ( Input_MeshHeight388_g80347 * Input_MeshHeight388_g80347 * Input_BoundsHeight390_g80347 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g80348 = WorldData19_g80348;
				#else
				float staticSwitch14_g80348 = ObjectData20_g80348;
				#endif
				half Final_Motion10_Mask321_g80347 = ( staticSwitch14_g80348 * 2.0 );
				half Input_BendingAmplitude376_g80347 = _MotionAmplitude_10;
				half Global_MotionValue640_g80347 = TVE_MotionValue_10;
				half2 Final_Bending631_g80347 = ( lerpResult516_g80347 * ( Final_Motion10_Mask321_g80347 * Input_BendingAmplitude376_g80347 * Input_WindPower449_g80347 * Input_WindPower449_g80347 * Global_MotionValue640_g80347 ) );
				float2 break636_g80347 = Final_Bending631_g80347;
				float3 appendResult637_g80347 = (float3(break636_g80347.x , 0.0 , break636_g80347.y));
				half3 Motion_10_Bending216_g80308 = appendResult637_g80347;
				half3 Angle44_g80332 = Motion_10_Bending216_g80308;
				half Angle44_g80333 = (Angle44_g80332).z;
				half3 VertexPos40_g80334 = ( VertexPosRotationAxis50_g80333 + ( VertexPosOtherAxis82_g80333 * cos( Angle44_g80333 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g80333 ) * sin( Angle44_g80333 ) ) );
				float3 appendResult74_g80334 = (float3(0.0 , 0.0 , VertexPos40_g80334.z));
				half3 VertexPosRotationAxis50_g80334 = appendResult74_g80334;
				float3 break84_g80334 = VertexPos40_g80334;
				float3 appendResult81_g80334 = (float3(break84_g80334.x , break84_g80334.y , 0.0));
				half3 VertexPosOtherAxis82_g80334 = appendResult81_g80334;
				half Angle44_g80334 = -(Angle44_g80332).x;
				half3 Input_Position419_g80359 = WorldPosition3905_g80308;
				float3 break459_g80359 = Input_Position419_g80359;
				float Sum_Position446_g80359 = ( break459_g80359.x + break459_g80359.y + break459_g80359.z );
				half Input_MotionScale321_g80359 = ( _MotionScale_20 * 0.1 );
				half Input_MotionVariation330_g80359 = _MotionVariation_20;
				half Input_GlobalVariation400_g80359 = Global_MeshVariation7760_g80308;
				float lerpResult128_g80360 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g80359 = _MotionSpeed_20;
				float temp_output_404_0_g80359 = ( lerpResult128_g80360 * Input_MotionSpeed62_g80359 );
				half Motion_SineA450_g80359 = sin( ( ( Sum_Position446_g80359 * Input_MotionScale321_g80359 ) + ( Input_MotionVariation330_g80359 * Input_GlobalVariation400_g80359 ) + temp_output_404_0_g80359 ) );
				half Motion_SineB395_g80359 = sin( ( ( temp_output_404_0_g80359 * 0.6842 ) + ( Sum_Position446_g80359 * Input_MotionScale321_g80359 ) ) );
				half3 Input_Position419_g80345 = VertexPosition3588_g80308;
				float3 normalizeResult518_g80345 = normalize( Input_Position419_g80345 );
				half2 Input_DirectionOS423_g80345 = Global_Wind_DirectionOS5692_g80308;
				float2 break521_g80345 = -Input_DirectionOS423_g80345;
				float3 appendResult522_g80345 = (float3(break521_g80345.x , 0.0 , break521_g80345.y));
				float dotResult519_g80345 = dot( normalizeResult518_g80345 , appendResult522_g80345 );
				half Input_Value62_g80345 = _MotionFacingValue;
				float lerpResult524_g80345 = lerp( 1.0 , (dotResult519_g80345*0.5 + 0.5) , Input_Value62_g80345);
				half ObjectData20_g80346 = max( lerpResult524_g80345 , 0.001 );
				half WorldData19_g80346 = 1.0;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g80346 = WorldData19_g80346;
				#else
				float staticSwitch14_g80346 = ObjectData20_g80346;
				#endif
				half Motion_FacingMask7691_g80308 = staticSwitch14_g80346;
				half Motion_20_Amplitude7628_g80308 = Motion_FacingMask7691_g80308;
				half Input_MotionAmplitude384_g80359 = Motion_20_Amplitude7628_g80308;
				half Input_GlobalWind407_g80359 = Global_Wind_Power2223_g80308;
				float4 break638_g80317 = abs( Noise_Complex703_g80317 );
				half Global_Noise_B5526_g80308 = break638_g80317.b;
				half Input_GlobalNoise411_g80359 = Global_Noise_B5526_g80308;
				float lerpResult413_g80359 = lerp( 1.8 , 0.4 , Input_GlobalWind407_g80359);
				half Motion_Amplitude418_g80359 = ( Input_MotionAmplitude384_g80359 * Input_GlobalWind407_g80359 * pow( Input_GlobalNoise411_g80359 , lerpResult413_g80359 ) );
				half Input_Squash58_g80359 = _MotionAmplitude_20;
				float3 appendResult7790_g80308 = (float3(0.0 , v.positionOS.xyz.y , 0.0));
				half Mesh_Spherical7697_g80308 = saturate( ( distance( v.positionOS.xyz , appendResult7790_g80308 ) / _BoundsRadiusValue ) );
				float4 break33_g80370 = _motion_mask_mode_20;
				float temp_output_30_0_g80370 = ( v.ase_color.r * break33_g80370.x );
				float temp_output_29_0_g80370 = ( v.ase_color.g * break33_g80370.y );
				float temp_output_31_0_g80370 = ( v.ase_color.b * break33_g80370.z );
				float lerpResult7813_g80308 = lerp( Mesh_Spherical7697_g80308 , ( temp_output_30_0_g80370 + temp_output_29_0_g80370 + temp_output_31_0_g80370 + ( v.ase_color.a * break33_g80370.w ) ) , saturate( _MotionMaskMode_20 ));
				half Mesh_Motion_207834_g80308 = lerpResult7813_g80308;
				half Input_MeshMotion_20388_g80359 = Mesh_Motion_207834_g80308;
				half Input_BoundsRadius390_g80359 = 1.0;
				half Global_MotionValue462_g80359 = TVE_MotionValue_20;
				half2 Input_DirectionOS366_g80359 = Global_Wind_DirectionOS5692_g80308;
				float2 break371_g80359 = Input_DirectionOS366_g80359;
				float3 appendResult372_g80359 = (float3(break371_g80359.x , ( Motion_SineA450_g80359 * 0.3 ) , break371_g80359.y));
				half3 Motion_20_Squash7632_g80308 = ( ( (max( Motion_SineA450_g80359 , Motion_SineB395_g80359 )*0.5 + 0.5) * Motion_Amplitude418_g80359 * Input_Squash58_g80359 * Input_MeshMotion_20388_g80359 * Input_BoundsRadius390_g80359 * Global_MotionValue462_g80359 ) * appendResult372_g80359 );
				half3 VertexPos40_g80321 = ( ( VertexPosRotationAxis50_g80334 + ( VertexPosOtherAxis82_g80334 * cos( Angle44_g80334 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g80334 ) * sin( Angle44_g80334 ) ) ) + Motion_20_Squash7632_g80308 );
				float3 appendResult74_g80321 = (float3(0.0 , VertexPos40_g80321.y , 0.0));
				float3 VertexPosRotationAxis50_g80321 = appendResult74_g80321;
				float3 break84_g80321 = VertexPos40_g80321;
				float3 appendResult81_g80321 = (float3(break84_g80321.x , 0.0 , break84_g80321.z));
				float3 VertexPosOtherAxis82_g80321 = appendResult81_g80321;
				half Input_Rolling379_g80359 = _MotionAmplitude_22;
				half Motion_20_Rolling7633_g80308 = ( Motion_SineA450_g80359 * Motion_Amplitude418_g80359 * Input_Rolling379_g80359 * Input_MeshMotion_20388_g80359 * Global_MotionValue462_g80359 );
				half Angle44_g80321 = Motion_20_Rolling7633_g80308;
				half3 Input_Position500_g80326 = WorldPosition3905_g80308;
				half Input_MotionScale321_g80326 = _MotionScale_32;
				half Input_MotionVariation330_g80326 = _MotionVariation_32;
				half Input_GlobalVariation372_g80326 = Global_MeshVariation7760_g80308;
				float lerpResult128_g80327 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g80326 = _MotionSpeed_32;
				float4 tex2DNode460_g80326 = SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( ( (Input_Position500_g80326).xz * Input_MotionScale321_g80326 * 0.03 ) + ( Input_MotionVariation330_g80326 * Input_GlobalVariation372_g80326 ) + ( lerpResult128_g80327 * Input_MotionSpeed62_g80326 * 0.02 ) ), 0.0 );
				float3 appendResult462_g80326 = (float3(tex2DNode460_g80326.r , tex2DNode460_g80326.g , tex2DNode460_g80326.b));
				half3 Flutter_Texture489_g80326 = (appendResult462_g80326*2.0 + -1.0);
				half Motion_30_Amplitude7534_g80308 = ( _MotionAmplitude_32 * Motion_FacingMask7691_g80308 );
				half Input_MotionAmplitude58_g80326 = Motion_30_Amplitude7534_g80308;
				float4 break33_g80369 = _motion_mask_mode_30;
				float temp_output_30_0_g80369 = ( v.ase_color.r * break33_g80369.x );
				float temp_output_29_0_g80369 = ( v.ase_color.g * break33_g80369.y );
				float temp_output_31_0_g80369 = ( v.ase_color.b * break33_g80369.z );
				float lerpResult7820_g80308 = lerp( v.texcoord.y , ( temp_output_30_0_g80369 + temp_output_29_0_g80369 + temp_output_31_0_g80369 + ( v.ase_color.a * break33_g80369.w ) ) , saturate( _MotionMaskMode_30 ));
				half Mesh_Motion_30144_g80308 = lerpResult7820_g80308;
				half Input_MeshMotion_30374_g80326 = Mesh_Motion_30144_g80308;
				half Input_GlobalWind471_g80326 = Global_Wind_Power2223_g80308;
				half Global_MotionValue503_g80326 = TVE_MotionValue_30;
				half Input_GlobalNoise472_g80326 = Global_Noise_B5526_g80308;
				float lerpResult466_g80326 = lerp( 2.4 , 0.6 , Input_GlobalWind471_g80326);
				half Flutter_Amplitude491_g80326 = ( Input_MotionAmplitude58_g80326 * Input_MeshMotion_30374_g80326 * Input_GlobalWind471_g80326 * Global_MotionValue503_g80326 * pow( Input_GlobalNoise472_g80326 , lerpResult466_g80326 ) );
				half3 Motion_30_Flutter263_g80308 = ( Flutter_Texture489_g80326 * Flutter_Amplitude491_g80326 );
				float3 Vertex_Motion_Object7655_g80308 = ( ( ( VertexPosRotationAxis50_g80321 + ( VertexPosOtherAxis82_g80321 * cos( Angle44_g80321 ) ) + ( cross( float3(0,1,0) , VertexPosOtherAxis82_g80321 ) * sin( Angle44_g80321 ) ) ) + Motion_30_Flutter263_g80308 ) + Mesh_PivotsOS7730_g80308 );
				float3 Final_VertexPosition890_g80308 = Vertex_Motion_Object7655_g80308;
				
				float4 break33_g80365 = _second_uvs_mode;
				float2 temp_output_30_0_g80365 = ( v.texcoord.xy * break33_g80365.x );
				float2 temp_output_29_0_g80365 = ( v.ase_texcoord3.xy * break33_g80365.y );
				float2 temp_output_31_0_g80365 = ( (WorldPosition3905_g80308).xz * break33_g80365.z );
				half2 Second_UVs_Tilling7781_g80308 = (_SecondUVs).xy;
				half2 Second_UVs_Scale7782_g80308 = ( 1.0 / Second_UVs_Tilling7781_g80308 );
				float2 lerpResult7786_g80308 = lerp( Second_UVs_Tilling7781_g80308 , Second_UVs_Scale7782_g80308 , _SecondUVsScaleMode);
				half2 Second_UVs_Offset7777_g80308 = (_SecondUVs).zw;
				float2 vertexToFrag11_g80309 = ( ( ( temp_output_30_0_g80365 + temp_output_29_0_g80365 + temp_output_31_0_g80365 ) * lerpResult7786_g80308 ) + Second_UVs_Offset7777_g80308 );
				o.ase_texcoord8.zw = vertexToFrag11_g80309;
				
				o.ase_texcoord8.xy = v.texcoord.xy;
				o.ase_color = v.ase_color;
				o.ase_texcoord9 = v.positionOS;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = Final_VertexPosition890_g80308;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.positionOS.xyz = vertexValue;
				#else
					v.positionOS.xyz += vertexValue;
				#endif

				v.normalOS = v.normalOS;
				v.tangentOS = v.tangentOS;

				VertexPositionInputs vertexInput = GetVertexPositionInputs( v.positionOS.xyz );
				VertexNormalInputs normalInput = GetVertexNormalInputs( v.normalOS, v.tangentOS );

				o.tSpace0 = float4( normalInput.normalWS, vertexInput.positionWS.x);
				o.tSpace1 = float4( normalInput.tangentWS, vertexInput.positionWS.y);
				o.tSpace2 = float4( normalInput.bitangentWS, vertexInput.positionWS.z);

				#if defined(LIGHTMAP_ON)
					OUTPUT_LIGHTMAP_UV(v.texcoord1, unity_LightmapST, o.lightmapUVOrVertexSH.xy);
				#endif

				#if defined(DYNAMICLIGHTMAP_ON)
					o.dynamicLightmapUV.xy = v.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
				#endif

				#if !defined(LIGHTMAP_ON)
					OUTPUT_SH(normalInput.normalWS.xyz, o.lightmapUVOrVertexSH.xyz);
				#endif

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					o.lightmapUVOrVertexSH.zw = v.texcoord.xy;
					o.lightmapUVOrVertexSH.xy = v.texcoord.xy * unity_LightmapST.xy + unity_LightmapST.zw;
				#endif

				half3 vertexLight = VertexLighting( vertexInput.positionWS, normalInput.normalWS );

				o.fogFactorAndVertexLight = half4(0, vertexLight);

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				o.positionCS = vertexInput.positionCS;
				o.clipPosV = vertexInput.positionCS;
				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 texcoord : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_color : COLOR;
				float4 ase_texcoord3 : TEXCOORD3;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.positionOS;
				o.normalOS = v.normalOS;
				o.tangentOS = v.tangentOS;
				o.texcoord = v.texcoord;
				o.texcoord1 = v.texcoord1;
				o.texcoord2 = v.texcoord2;
				o.texcoord = v.texcoord;
				o.ase_color = v.ase_color;
				o.ase_texcoord3 = v.ase_texcoord3;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.positionOS = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				o.texcoord = patch[0].texcoord * bary.x + patch[1].texcoord * bary.y + patch[2].texcoord * bary.z;
				o.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
				o.texcoord2 = patch[0].texcoord2 * bary.x + patch[1].texcoord2 * bary.y + patch[2].texcoord2 * bary.z;
				o.texcoord = patch[0].texcoord * bary.x + patch[1].texcoord * bary.y + patch[2].texcoord * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].vertex.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			FragmentOutput frag ( VertexOutput IN
								#ifdef ASE_DEPTH_WRITE_ON
								,out float outputDepth : ASE_SV_DEPTH
								#endif
								, bool ase_vface : SV_IsFrontFace )
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(IN);

				#ifdef LOD_FADE_CROSSFADE
					LODFadeCrossFade( IN.positionCS );
				#endif

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					float2 sampleCoords = (IN.lightmapUVOrVertexSH.zw / _TerrainHeightmapRecipSize.zw + 0.5f) * _TerrainHeightmapRecipSize.xy;
					float3 WorldNormal = TransformObjectToWorldNormal(normalize(SAMPLE_TEXTURE2D(_TerrainNormalmapTexture, sampler_TerrainNormalmapTexture, sampleCoords).rgb * 2 - 1));
					float3 WorldTangent = -cross(GetObjectToWorldMatrix()._13_23_33, WorldNormal);
					float3 WorldBiTangent = cross(WorldNormal, -WorldTangent);
				#else
					float3 WorldNormal = normalize( IN.tSpace0.xyz );
					float3 WorldTangent = IN.tSpace1.xyz;
					float3 WorldBiTangent = IN.tSpace2.xyz;
				#endif

				float3 WorldPosition = float3(IN.tSpace0.w,IN.tSpace1.w,IN.tSpace2.w);
				float3 WorldViewDirection = _WorldSpaceCameraPos.xyz  - WorldPosition;
				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				float4 ClipPos = IN.clipPosV;
				float4 ScreenPos = ComputeScreenPos( IN.clipPosV );

				float2 NormalizedScreenSpaceUV = GetNormalizedScreenSpaceUV(IN.positionCS);

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					ShadowCoords = IN.shadowCoord;
				#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
					ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
				#else
					ShadowCoords = float4(0, 0, 0, 0);
				#endif

				WorldViewDirection = SafeNormalize( WorldViewDirection );

				half2 Main_UVs15_g80308 = ( ( IN.ase_texcoord8.xy * (_MainUVs).xy ) + (_MainUVs).zw );
				float4 tex2DNode29_g80308 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs15_g80308 );
				float3 lerpResult6223_g80308 = lerp( float3( 1,1,1 ) , (tex2DNode29_g80308).rgb , _MainAlbedoValue);
				float4 tex2DNode35_g80308 = SAMPLE_TEXTURE2D( _MainMaskTex, sampler_Linear_Repeat, Main_UVs15_g80308 );
				half Main_Mask57_g80308 = tex2DNode35_g80308.b;
				float clampResult17_g80376 = clamp( Main_Mask57_g80308 , 0.0001 , 0.9999 );
				float temp_output_7_0_g80377 = _MainMaskMinValue;
				float temp_output_10_0_g80377 = ( _MainMaskMaxValue - temp_output_7_0_g80377 );
				half Main_Mask_Remap5765_g80308 = saturate( ( ( clampResult17_g80376 - temp_output_7_0_g80377 ) / ( temp_output_10_0_g80377 + 0.0001 ) ) );
				float lerpResult7896_g80308 = lerp( 1.0 , Main_Mask_Remap5765_g80308 , _MainColorMode);
				float4 lerpResult7876_g80308 = lerp( _MainColorTwo , _MainColor , lerpResult7896_g80308);
				half3 Main_Color_RGB7884_g80308 = (lerpResult7876_g80308).rgb;
				half3 Main_Albedo99_g80308 = ( lerpResult6223_g80308 * Main_Color_RGB7884_g80308 );
				float2 vertexToFrag11_g80309 = IN.ase_texcoord8.zw;
				half2 Second_UVs17_g80308 = vertexToFrag11_g80309;
				float4 tex2DNode89_g80308 = SAMPLE_TEXTURE2D( _SecondAlbedoTex, sampler_SecondAlbedoTex, Second_UVs17_g80308 );
				float3 lerpResult6225_g80308 = lerp( float3( 1,1,1 ) , (tex2DNode89_g80308).rgb , _SecondAlbedoValue);
				float4 tex2DNode33_g80308 = SAMPLE_TEXTURE2D( _SecondMaskTex, sampler_Linear_Repeat, Second_UVs17_g80308 );
				half Second_Mask81_g80308 = tex2DNode33_g80308.b;
				float clampResult17_g80378 = clamp( Second_Mask81_g80308 , 0.0001 , 0.9999 );
				float temp_output_7_0_g80379 = _SecondMaskMinValue;
				float temp_output_10_0_g80379 = ( _SecondMaskMaxValue - temp_output_7_0_g80379 );
				half Second_Mask_Remap6130_g80308 = saturate( ( ( clampResult17_g80378 - temp_output_7_0_g80379 ) / ( temp_output_10_0_g80379 + 0.0001 ) ) );
				float lerpResult7897_g80308 = lerp( 1.0 , Second_Mask_Remap6130_g80308 , _SecondColorMode);
				float4 lerpResult7886_g80308 = lerp( _SecondColorTwo , _SecondColor , lerpResult7897_g80308);
				half3 Second_Color_RGB7894_g80308 = (lerpResult7886_g80308).rgb;
				half3 Second_Albedo153_g80308 = ( lerpResult6225_g80308 * Second_Color_RGB7894_g80308 );
				#ifdef UNITY_COLORSPACE_GAMMA
				float staticSwitch1_g80311 = 2.0;
				#else
				float staticSwitch1_g80311 = 4.594794;
				#endif
				float3 lerpResult4834_g80308 = lerp( ( Main_Albedo99_g80308 * Second_Albedo153_g80308 * staticSwitch1_g80311 ) , Second_Albedo153_g80308 , _DetailBlendMode);
				float lerpResult6885_g80308 = lerp( Main_Mask57_g80308 , Second_Mask81_g80308 , _DetailMaskMode);
				float clampResult17_g80325 = clamp( lerpResult6885_g80308 , 0.0001 , 0.9999 );
				float temp_output_7_0_g80324 = _DetailMaskMinValue;
				float temp_output_10_0_g80324 = ( _DetailMaskMaxValue - temp_output_7_0_g80324 );
				half Blend_Mask_Texture6794_g80308 = saturate( ( ( clampResult17_g80325 - temp_output_7_0_g80324 ) / ( temp_output_10_0_g80324 + 0.0001 ) ) );
				half4 Normal_Packed45_g80375 = SAMPLE_TEXTURE2D( _MainNormalTex, sampler_Linear_Repeat, Main_UVs15_g80308 );
				float2 appendResult58_g80375 = (float2(( (Normal_Packed45_g80375).x * (Normal_Packed45_g80375).w ) , (Normal_Packed45_g80375).y));
				half2 Normal_Default50_g80375 = appendResult58_g80375;
				half2 Normal_ASTC41_g80375 = (Normal_Packed45_g80375).xy;
				#ifdef UNITY_ASTC_NORMALMAP_ENCODING
				float2 staticSwitch38_g80375 = Normal_ASTC41_g80375;
				#else
				float2 staticSwitch38_g80375 = Normal_Default50_g80375;
				#endif
				half2 Normal_NO_DTX544_g80375 = (Normal_Packed45_g80375).wy;
				#ifdef UNITY_NO_DXT5nm
				float2 staticSwitch37_g80375 = Normal_NO_DTX544_g80375;
				#else
				float2 staticSwitch37_g80375 = staticSwitch38_g80375;
				#endif
				float2 temp_output_6555_0_g80308 = ( (staticSwitch37_g80375*2.0 + -1.0) * _MainNormalValue );
				float3 appendResult7388_g80308 = (float3(temp_output_6555_0_g80308 , 1.0));
				float3 tanToWorld0 = float3( WorldTangent.x, WorldBiTangent.x, WorldNormal.x );
				float3 tanToWorld1 = float3( WorldTangent.y, WorldBiTangent.y, WorldNormal.y );
				float3 tanToWorld2 = float3( WorldTangent.z, WorldBiTangent.z, WorldNormal.z );
				float3 tanNormal7389_g80308 = appendResult7388_g80308;
				float3 worldNormal7389_g80308 = float3(dot(tanToWorld0,tanNormal7389_g80308), dot(tanToWorld1,tanNormal7389_g80308), dot(tanToWorld2,tanNormal7389_g80308));
				half3 Main_NormalWS7390_g80308 = worldNormal7389_g80308;
				float4 break33_g80385 = _detail_mesh_mode;
				float temp_output_30_0_g80385 = ( IN.ase_color.r * break33_g80385.x );
				float temp_output_29_0_g80385 = ( IN.ase_color.g * break33_g80385.y );
				float temp_output_31_0_g80385 = ( IN.ase_color.b * break33_g80385.z );
				float lerpResult7836_g80308 = lerp( ((Main_NormalWS7390_g80308).y*0.5 + 0.5) , ( temp_output_30_0_g80385 + temp_output_29_0_g80385 + temp_output_31_0_g80385 + ( IN.ase_color.a * break33_g80385.w ) ) , saturate( _DetailMeshMode ));
				float clampResult17_g80323 = clamp( lerpResult7836_g80308 , 0.0001 , 0.9999 );
				float temp_output_7_0_g80322 = _DetailMeshMinValue;
				float temp_output_10_0_g80322 = ( _DetailMeshMaxValue - temp_output_7_0_g80322 );
				half Blend_Mask_Mesh1540_g80308 = saturate( ( ( clampResult17_g80323 - temp_output_7_0_g80322 ) / ( temp_output_10_0_g80322 + 0.0001 ) ) );
				float clampResult17_g80352 = clamp( ( Blend_Mask_Texture6794_g80308 * Blend_Mask_Mesh1540_g80308 ) , 0.0001 , 0.9999 );
				float temp_output_7_0_g80353 = _DetailBlendMinValue;
				float temp_output_10_0_g80353 = ( _DetailBlendMaxValue - temp_output_7_0_g80353 );
				half Blend_Mask147_g80308 = ( saturate( ( ( clampResult17_g80352 - temp_output_7_0_g80353 ) / ( temp_output_10_0_g80353 + 0.0001 ) ) ) * _DetailMode * _DetailValue );
				float3 lerpResult235_g80308 = lerp( Main_Albedo99_g80308 , lerpResult4834_g80308 , Blend_Mask147_g80308);
				#ifdef TVE_FEATURE_DETAIL
				float3 staticSwitch255_g80308 = lerpResult235_g80308;
				#else
				float3 staticSwitch255_g80308 = Main_Albedo99_g80308;
				#endif
				half3 Blend_Albedo265_g80308 = staticSwitch255_g80308;
				half Mesh_Height1524_g80308 = saturate( ( IN.ase_texcoord9.xyz.y / _BoundsHeightValue ) );
				float temp_output_7_0_g80367 = _GradientMinValue;
				float temp_output_10_0_g80367 = ( _GradientMaxValue - temp_output_7_0_g80367 );
				half Gradient_Value2784_g80308 = saturate( ( ( Mesh_Height1524_g80308 - temp_output_7_0_g80367 ) / ( temp_output_10_0_g80367 + 0.0001 ) ) );
				float3 lerpResult2779_g80308 = lerp( (_GradientColorTwo).rgb , (_GradientColorOne).rgb , Gradient_Value2784_g80308);
				float lerpResult6617_g80308 = lerp( Main_Mask_Remap5765_g80308 , Second_Mask_Remap6130_g80308 , Blend_Mask147_g80308);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch6623_g80308 = lerpResult6617_g80308;
				#else
				float staticSwitch6623_g80308 = Main_Mask_Remap5765_g80308;
				#endif
				half Blend_Mask_Remap6621_g80308 = staticSwitch6623_g80308;
				half Gradient_Mask6207_g80308 = Blend_Mask_Remap6621_g80308;
				float3 lerpResult6208_g80308 = lerp( float3( 1,1,1 ) , lerpResult2779_g80308 , Gradient_Mask6207_g80308);
				half3 Tint_Gradient_Color5769_g80308 = lerpResult6208_g80308;
				float3 appendResult7790_g80308 = (float3(0.0 , IN.ase_texcoord9.xyz.y , 0.0));
				half Mesh_Spherical7697_g80308 = saturate( ( distance( IN.ase_texcoord9.xyz , appendResult7790_g80308 ) / _BoundsRadiusValue ) );
				float4 break33_g80384 = _vertex_occlusion_mask_mode;
				float temp_output_30_0_g80384 = ( IN.ase_color.r * break33_g80384.x );
				float temp_output_29_0_g80384 = ( IN.ase_color.g * break33_g80384.y );
				float temp_output_31_0_g80384 = ( IN.ase_color.b * break33_g80384.z );
				float lerpResult7809_g80308 = lerp( Mesh_Spherical7697_g80308 , ( temp_output_30_0_g80384 + temp_output_29_0_g80384 + temp_output_31_0_g80384 + ( IN.ase_color.a * break33_g80384.w ) ) , saturate( _VertexOcclusionMaskMode ));
				float clampResult17_g80371 = clamp( lerpResult7809_g80308 , 0.0001 , 0.9999 );
				float temp_output_7_0_g80366 = _VertexOcclusionMinValue;
				float temp_output_10_0_g80366 = ( _VertexOcclusionMaxValue - temp_output_7_0_g80366 );
				half Occlusion_Mask6432_g80308 = saturate( ( ( clampResult17_g80371 - temp_output_7_0_g80366 ) / ( temp_output_10_0_g80366 + 0.0001 ) ) );
				float3 lerpResult2945_g80308 = lerp( (_VertexOcclusionColor).rgb , float3( 1,1,1 ) , Occlusion_Mask6432_g80308);
				half3 Occlusion_Color648_g80308 = lerpResult2945_g80308;
				half3 Blend_Albedo_Tinted2808_g80308 = ( Blend_Albedo265_g80308 * Tint_Gradient_Color5769_g80308 * Occlusion_Color648_g80308 );
				half3 Global_OverlayColor1758_g80308 = (TVE_OverlayColor).rgb;
				half Global_OverlayIntensity154_g80308 = TVE_OverlayValue;
				half Overlay_Value5738_g80308 = ( _GlobalOverlay * Global_OverlayIntensity154_g80308 );
				half2 Main_Normal137_g80308 = temp_output_6555_0_g80308;
				float2 lerpResult3372_g80308 = lerp( float2( 0,0 ) , Main_Normal137_g80308 , _DetailNormalValue);
				float3x3 ase_worldToTangent = float3x3(WorldTangent,WorldBiTangent,WorldNormal);
				half4 Normal_Packed45_g80380 = SAMPLE_TEXTURE2D( _SecondNormalTex, sampler_Linear_Repeat, Second_UVs17_g80308 );
				float2 appendResult58_g80380 = (float2(( (Normal_Packed45_g80380).x * (Normal_Packed45_g80380).w ) , (Normal_Packed45_g80380).y));
				half2 Normal_Default50_g80380 = appendResult58_g80380;
				half2 Normal_ASTC41_g80380 = (Normal_Packed45_g80380).xy;
				#ifdef UNITY_ASTC_NORMALMAP_ENCODING
				float2 staticSwitch38_g80380 = Normal_ASTC41_g80380;
				#else
				float2 staticSwitch38_g80380 = Normal_Default50_g80380;
				#endif
				half2 Normal_NO_DTX544_g80380 = (Normal_Packed45_g80380).wy;
				#ifdef UNITY_NO_DXT5nm
				float2 staticSwitch37_g80380 = Normal_NO_DTX544_g80380;
				#else
				float2 staticSwitch37_g80380 = staticSwitch38_g80380;
				#endif
				float2 temp_output_6560_0_g80308 = ( (staticSwitch37_g80380*2.0 + -1.0) * _SecondNormalValue );
				half2 Normal_Planar45_g80381 = temp_output_6560_0_g80308;
				float2 break64_g80381 = Normal_Planar45_g80381;
				float3 appendResult65_g80381 = (float3(break64_g80381.x , 0.0 , break64_g80381.y));
				float2 temp_output_7775_0_g80308 = (mul( ase_worldToTangent, appendResult65_g80381 )).xy;
				float2 ifLocalVar7776_g80308 = 0;
				if( _SecondUVsMode >= 2.0 )
				ifLocalVar7776_g80308 = temp_output_7775_0_g80308;
				else
				ifLocalVar7776_g80308 = temp_output_6560_0_g80308;
				half2 Second_Normal179_g80308 = ifLocalVar7776_g80308;
				float2 temp_output_36_0_g80312 = ( lerpResult3372_g80308 + Second_Normal179_g80308 );
				float2 lerpResult3376_g80308 = lerp( Main_Normal137_g80308 , temp_output_36_0_g80312 , Blend_Mask147_g80308);
				#ifdef TVE_FEATURE_DETAIL
				float2 staticSwitch267_g80308 = lerpResult3376_g80308;
				#else
				float2 staticSwitch267_g80308 = Main_Normal137_g80308;
				#endif
				half2 Blend_Normal312_g80308 = staticSwitch267_g80308;
				float3 appendResult7377_g80308 = (float3(Blend_Normal312_g80308 , 1.0));
				float3 tanNormal7376_g80308 = appendResult7377_g80308;
				float3 worldNormal7376_g80308 = float3(dot(tanToWorld0,tanNormal7376_g80308), dot(tanToWorld1,tanNormal7376_g80308), dot(tanToWorld2,tanNormal7376_g80308));
				half3 Blend_NormalWS7375_g80308 = worldNormal7376_g80308;
				float lerpResult7510_g80308 = lerp( 1.0 , saturate( (Blend_NormalWS7375_g80308).y ) , _OverlayProjectionValue);
				half Overlay_Projection6081_g80308 = lerpResult7510_g80308;
				float3 temp_output_3_0_g80316 = ( Blend_Albedo265_g80308 * Tint_Gradient_Color5769_g80308 );
				float dotResult20_g80316 = dot( temp_output_3_0_g80316 , float3(0.2126,0.7152,0.0722) );
				float clampResult6740_g80308 = clamp( saturate( ( dotResult20_g80316 * 5.0 ) ) , 0.2 , 1.0 );
				half Blend_Albedo_Globals6410_g80308 = clampResult6740_g80308;
				half Overlay_Shading6688_g80308 = Blend_Albedo_Globals6410_g80308;
				half Occlusion_Alpha6463_g80308 = _VertexOcclusionColor.a;
				float lerpResult7923_g80308 = lerp( Occlusion_Mask6432_g80308 , ( 1.0 - Occlusion_Mask6432_g80308 ) , _VertexOcclusionOverlayMode);
				float lerpResult7921_g80308 = lerp( Occlusion_Alpha6463_g80308 , 1.0 , lerpResult7923_g80308);
				half Occlusion_Overlay6471_g80308 = lerpResult7921_g80308;
				half Overlay_Variation4560_g80308 = 1.0;
				float temp_output_7_0_g80313 = 0.1;
				float temp_output_10_0_g80313 = ( 0.2 - temp_output_7_0_g80313 );
				half Overlay_Mask269_g80308 = saturate( ( ( ( Overlay_Value5738_g80308 * Overlay_Projection6081_g80308 * Overlay_Shading6688_g80308 * Occlusion_Overlay6471_g80308 * Overlay_Variation4560_g80308 ) - temp_output_7_0_g80313 ) / ( temp_output_10_0_g80313 + 0.0001 ) ) );
				float3 lerpResult336_g80308 = lerp( Blend_Albedo_Tinted2808_g80308 , Global_OverlayColor1758_g80308 , Overlay_Mask269_g80308);
				half3 Blend_Albedo_Overlay359_g80308 = lerpResult336_g80308;
				half3 Subsurface_Color1722_g80308 = ( (_SubsurfaceColor).rgb * Blend_Albedo_Overlay359_g80308 );
				half Global_Subsurface7580_g80308 = TVE_SubsurfaceValue;
				half Global_OverlaySubsurface5667_g80308 = TVE_OverlaySubsurface;
				float lerpResult7362_g80308 = lerp( 1.0 , Global_OverlaySubsurface5667_g80308 , Occlusion_Mask6432_g80308);
				half Overlay_Subsurface7361_g80308 = lerpResult7362_g80308;
				half Subsurface_Intensity1752_g80308 = ( _SubsurfaceValue * Global_Subsurface7580_g80308 * Overlay_Subsurface7361_g80308 );
				float lerpResult7903_g80308 = lerp( 1.0 , Blend_Mask_Remap6621_g80308 , _SubsurfaceMaskValue);
				half Subsurface_Mask1557_g80308 = lerpResult7903_g80308;
				half3 MainLight_Direction7581_g80308 = TVE_MainLightDirection;
				float3 normalizeResult7596_g80308 = normalize( WorldViewDirection );
				float3 ViewDirection7598_g80308 = normalizeResult7596_g80308;
				float dotResult7591_g80308 = dot( -MainLight_Direction7581_g80308 , ViewDirection7598_g80308 );
				float saferPower7590_g80308 = abs( saturate( dotResult7591_g80308 ) );
				#ifdef UNITY_PASS_FORWARDADD
				float staticSwitch7595_g80308 = 0.0;
				#else
				float staticSwitch7595_g80308 = ( pow( saferPower7590_g80308 , _SubsurfaceAngleValue ) * _SubsurfaceScatteringValue );
				#endif
				half Mask_Subsurface_View7587_g80308 = staticSwitch7595_g80308;
				half3 Subsurface_Approximation7607_g80308 = ( Subsurface_Color1722_g80308 * Subsurface_Intensity1752_g80308 * Subsurface_Mask1557_g80308 * Mask_Subsurface_View7587_g80308 );
				half3 Blend_Albedo_Subsurface7608_g80308 = ( Blend_Albedo_Overlay359_g80308 + Subsurface_Approximation7607_g80308 );
				
				half Global_OverlayNormalScale6581_g80308 = TVE_OverlayNormalValue;
				float lerpResult6585_g80308 = lerp( 1.0 , Global_OverlayNormalScale6581_g80308 , Overlay_Mask269_g80308);
				half2 Blend_Normal_Overlay366_g80308 = ( Blend_Normal312_g80308 * lerpResult6585_g80308 );
				float3 appendResult6568_g80308 = (float3(Blend_Normal_Overlay366_g80308 , 1.0));
				float3 temp_output_13_0_g80310 = appendResult6568_g80308;
				float3 temp_output_33_0_g80310 = ( temp_output_13_0_g80310 * _render_normals );
				float3 switchResult12_g80310 = (((ase_vface>0)?(temp_output_13_0_g80310):(temp_output_33_0_g80310)));
				
				float3 temp_cast_2 = (0.0).xxx;
				half3 Emissive_Color7162_g80308 = (_EmissiveColor).rgb;
				half2 Emissive_UVs2468_g80308 = ( ( IN.ase_texcoord8.xy * (_EmissiveUVs).xy ) + (_EmissiveUVs).zw );
				float temp_output_7_0_g80383 = _EmissiveTexMinValue;
				float3 temp_cast_3 = (temp_output_7_0_g80383).xxx;
				float temp_output_10_0_g80383 = ( _EmissiveTexMaxValue - temp_output_7_0_g80383 );
				half3 Emissive_Texture7022_g80308 = saturate( ( ( (SAMPLE_TEXTURE2D( _EmissiveTex, sampler_Linear_Repeat, Emissive_UVs2468_g80308 )).rgb - temp_cast_3 ) / ( temp_output_10_0_g80383 + 0.0001 ) ) );
				half3 Emissive_Mask6968_g80308 = Emissive_Texture7022_g80308;
				float3 temp_output_3_0_g80382 = ( Emissive_Color7162_g80308 * Emissive_Mask6968_g80308 );
				float temp_output_15_0_g80382 = _emissive_intensity_value;
				float3 temp_output_23_0_g80382 = ( temp_output_3_0_g80382 * temp_output_15_0_g80382 );
				#ifdef TVE_FEATURE_EMISSIVE
				float3 staticSwitch7912_g80308 = temp_output_23_0_g80382;
				#else
				float3 staticSwitch7912_g80308 = temp_cast_2;
				#endif
				half3 Final_Emissive2476_g80308 = staticSwitch7912_g80308;
				
				half Render_Specular4861_g80308 = _RenderSpecular;
				float3 temp_cast_4 = (( 0.04 * Render_Specular4861_g80308 )).xxx;
				
				half Main_Smoothness227_g80308 = ( tex2DNode35_g80308.a * _MainSmoothnessValue );
				half Second_Smoothness236_g80308 = ( tex2DNode33_g80308.a * _SecondSmoothnessValue );
				float lerpResult266_g80308 = lerp( Main_Smoothness227_g80308 , Second_Smoothness236_g80308 , Blend_Mask147_g80308);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch297_g80308 = lerpResult266_g80308;
				#else
				float staticSwitch297_g80308 = Main_Smoothness227_g80308;
				#endif
				half Blend_Smoothness314_g80308 = staticSwitch297_g80308;
				half Global_OverlaySmoothness311_g80308 = TVE_OverlaySmoothness;
				float lerpResult343_g80308 = lerp( Blend_Smoothness314_g80308 , Global_OverlaySmoothness311_g80308 , Overlay_Mask269_g80308);
				half Blend_Smoothness_Overlay371_g80308 = lerpResult343_g80308;
				
				float lerpResult240_g80308 = lerp( 1.0 , tex2DNode35_g80308.g , _MainOcclusionValue);
				half Main_Occlusion247_g80308 = lerpResult240_g80308;
				float lerpResult239_g80308 = lerp( 1.0 , tex2DNode33_g80308.g , _SecondOcclusionValue);
				half Second_Occlusion251_g80308 = lerpResult239_g80308;
				float lerpResult294_g80308 = lerp( Main_Occlusion247_g80308 , Second_Occlusion251_g80308 , Blend_Mask147_g80308);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch310_g80308 = lerpResult294_g80308;
				#else
				float staticSwitch310_g80308 = Main_Occlusion247_g80308;
				#endif
				half Blend_Occlusion323_g80308 = staticSwitch310_g80308;
				
				float localCustomAlphaClip19_g80314 = ( 0.0 );
				half Main_Alpha316_g80308 = tex2DNode29_g80308.a;
				half Second_Alpha5007_g80308 = tex2DNode89_g80308.a;
				float lerpResult6153_g80308 = lerp( Main_Alpha316_g80308 , Second_Alpha5007_g80308 , Blend_Mask147_g80308);
				float lerpResult6785_g80308 = lerp( ( Main_Alpha316_g80308 * Second_Alpha5007_g80308 ) , lerpResult6153_g80308 , _DetailAlphaMode);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch6158_g80308 = lerpResult6785_g80308;
				#else
				float staticSwitch6158_g80308 = Main_Alpha316_g80308;
				#endif
				half Blend_Alpha6157_g80308 = staticSwitch6158_g80308;
				half AlphaTreshold2132_g80308 = _AlphaClipValue;
				float temp_output_3_0_g80314 = ( Blend_Alpha6157_g80308 - AlphaTreshold2132_g80308 );
				float Alpha19_g80314 = temp_output_3_0_g80314;
				float temp_output_15_0_g80314 = 0.01;
				float Treshold19_g80314 = temp_output_15_0_g80314;
				{
				#if defined (TVE_FEATURE_CLIP)
				#if defined (TVE_IS_HD_PIPELINE)
				#if !defined(SHADERPASS_FORWARD_BYPASS_ALPHA_TEST) && !defined(SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST)
				clip(Alpha19_g80314 - Treshold19_g80314);
				#endif
				#else
				clip(Alpha19_g80314 - Treshold19_g80314);
				#endif
				#endif
				}
				half Final_Clip914_g80308 = Alpha19_g80314;
				

				float3 BaseColor = Blend_Albedo_Subsurface7608_g80308;
				float3 Normal = switchResult12_g80310;
				float3 Emission = Final_Emissive2476_g80308;
				float3 Specular = temp_cast_4;
				float Metallic = 0;
				float Smoothness = Blend_Smoothness_Overlay371_g80308;
				float Occlusion = Blend_Occlusion323_g80308;
				float Alpha = Final_Clip914_g80308;
				float AlphaClipThreshold = 0.5;
				float AlphaClipThresholdShadow = 0.5;
				float3 BakedGI = 0;
				float3 RefractionColor = 1;
				float RefractionIndex = 1;
				float3 Transmission = 1;
				float3 Translucency = 1;

				#ifdef ASE_DEPTH_WRITE_ON
					float DepthValue = IN.positionCS.z;
				#endif

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				InputData inputData = (InputData)0;
				inputData.positionWS = WorldPosition;
				inputData.positionCS = IN.positionCS;
				inputData.shadowCoord = ShadowCoords;

				#ifdef _NORMALMAP
					#if _NORMAL_DROPOFF_TS
						inputData.normalWS = TransformTangentToWorld(Normal, half3x3( WorldTangent, WorldBiTangent, WorldNormal ));
					#elif _NORMAL_DROPOFF_OS
						inputData.normalWS = TransformObjectToWorldNormal(Normal);
					#elif _NORMAL_DROPOFF_WS
						inputData.normalWS = Normal;
					#endif
				#else
					inputData.normalWS = WorldNormal;
				#endif

				inputData.normalWS = NormalizeNormalPerPixel(inputData.normalWS);
				inputData.viewDirectionWS = SafeNormalize( WorldViewDirection );

				inputData.vertexLighting = IN.fogFactorAndVertexLight.yzw;

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					float3 SH = SampleSH(inputData.normalWS.xyz);
				#else
					float3 SH = IN.lightmapUVOrVertexSH.xyz;
				#endif

				#ifdef ASE_BAKEDGI
					inputData.bakedGI = BakedGI;
				#else
					#if defined(DYNAMICLIGHTMAP_ON)
						inputData.bakedGI = SAMPLE_GI( IN.lightmapUVOrVertexSH.xy, IN.dynamicLightmapUV.xy, SH, inputData.normalWS);
					#else
						inputData.bakedGI = SAMPLE_GI( IN.lightmapUVOrVertexSH.xy, SH, inputData.normalWS );
					#endif
				#endif

				inputData.normalizedScreenSpaceUV = NormalizedScreenSpaceUV;
				inputData.shadowMask = SAMPLE_SHADOWMASK(IN.lightmapUVOrVertexSH.xy);

				#if defined(DEBUG_DISPLAY)
					#if defined(DYNAMICLIGHTMAP_ON)
						inputData.dynamicLightmapUV = IN.dynamicLightmapUV.xy;
						#endif
					#if defined(LIGHTMAP_ON)
						inputData.staticLightmapUV = IN.lightmapUVOrVertexSH.xy;
					#else
						inputData.vertexSH = SH;
					#endif
				#endif

				#ifdef _DBUFFER
					ApplyDecal(IN.positionCS,
						BaseColor,
						Specular,
						inputData.normalWS,
						Metallic,
						Occlusion,
						Smoothness);
				#endif

				BRDFData brdfData;
				InitializeBRDFData
				(BaseColor, Metallic, Specular, Smoothness, Alpha, brdfData);

				Light mainLight = GetMainLight(inputData.shadowCoord, inputData.positionWS, inputData.shadowMask);
				half4 color;
				MixRealtimeAndBakedGI(mainLight, inputData.normalWS, inputData.bakedGI, inputData.shadowMask);
				color.rgb = GlobalIllumination(brdfData, inputData.bakedGI, Occlusion, inputData.positionWS, inputData.normalWS, inputData.viewDirectionWS);
				color.a = Alpha;

				#ifdef ASE_FINAL_COLOR_ALPHA_MULTIPLY
					color.rgb *= color.a;
				#endif

				#ifdef ASE_DEPTH_WRITE_ON
					outputDepth = DepthValue;
				#endif

				return BRDFDataToGbuffer(brdfData, inputData, Smoothness, Emission + color.rgb, Occlusion);
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "SceneSelectionPass"
			Tags { "LightMode"="SceneSelectionPass" }

			Cull Off
			AlphaToMask Off

			HLSLPROGRAM

			#define _NORMAL_DROPOFF_TS 1
			#define ASE_FOG 1
			#define _SPECULAR_SETUP 1
			#define ASE_ABSOLUTE_VERTEX_POS 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140007
			#define ASE_USING_SAMPLING_MACROS 1


			#pragma vertex vert
			#pragma fragment frag

			#define SCENESELECTIONPASS 1

			#define ATTRIBUTES_NEED_NORMAL
			#define ATTRIBUTES_NEED_TANGENT
			#define SHADERPASS SHADERPASS_DEPTHONLY

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_COLOR
			#pragma shader_feature_local_fragment TVE_FEATURE_CLIP
			#pragma shader_feature_local TVE_FEATURE_DETAIL
			#define TVE_IS_PLANT_SHADER
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END
			#define TVE_IS_STANDARD_SHADER
			#define THE_VEGETATION_ENGINE
			#define TVE_IS_UNIVERSAL_PIPELINE


			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_tangent : TANGENT;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 positionCS : SV_POSITION;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _EmissiveTexRemap;
			half4 _GradientColorOne;
			half4 _GradientColorTwo;
			half4 _VertexOcclusionRemap;
			half4 _DetailBlendRemap;
			half4 _VertexOcclusionColor;
			half4 _vertex_occlusion_mask_mode;
			half4 _SecondUVs;
			float4 _GradientMaskRemap;
			half4 _second_uvs_mode;
			half4 _SecondColorTwo;
			half4 _SecondColor;
			half4 _MainColor;
			half4 _MainColorTwo;
			half4 _motion_mask_mode_20;
			half4 _DetailMeshRemap;
			half4 _SubsurfaceColor;
			float4 _SubsurfaceDiffusion_Asset;
			half4 _detail_mesh_mode;
			half4 _SecondMaskRemap;
			half4 _MainMaskRemap;
			float4 _Color;
			half4 _MainUVs;
			half4 _motion_variation_mode;
			half4 _DetailMaskRemap;
			half4 _motion_mask_mode_30;
			half4 _EmissiveUVs;
			half4 _EmissiveColor;
			half3 _render_normals;
			half _DetailBlendMode;
			half _SecondMaskMinValue;
			half _DetailMaskMode;
			half _SecondColorMode;
			half _SecondMaskMaxValue;
			half _render_cull;
			half _SecondUVsScaleMode;
			half _MainColorMode;
			half _MainMaskMaxValue;
			half _MainMaskMinValue;
			half _MainAlbedoValue;
			half _MotionMaskMode_30;
			half _MotionAmplitude_32;
			float _MotionSpeed_32;
			float _MotionVariation_32;
			float _MotionScale_32;
			half _MotionAmplitude_22;
			half _MotionMaskMode_20;
			half _SecondAlbedoValue;
			half _DetailMaskMinValue;
			half _DetailBlendMinValue;
			half _MainNormalValue;
			half _SecondOcclusionValue;
			half _MainOcclusionValue;
			half _SecondSmoothnessValue;
			half _MainSmoothnessValue;
			half _RenderSpecular;
			float _emissive_intensity_value;
			half _EmissiveTexMaxValue;
			half _EmissiveTexMinValue;
			half _SubsurfaceMaskValue;
			half _SubsurfaceValue;
			half _VertexOcclusionOverlayMode;
			half _OverlayProjectionValue;
			half _SecondNormalValue;
			half _SecondUVsMode;
			half _DetailNormalValue;
			half _GlobalOverlay;
			half _VertexOcclusionMaxValue;
			half _VertexOcclusionMinValue;
			half _VertexOcclusionMaskMode;
			half _GradientMaxValue;
			half _GradientMinValue;
			half _DetailValue;
			half _DetailMode;
			half _DetailBlendMaxValue;
			half _DetailMeshMaxValue;
			half _DetailMeshMinValue;
			half _DetailMeshMode;
			half _DetailMaskMaxValue;
			half _BoundsRadiusValue;
			half _MotionAmplitude_10;
			half _MotionFacingValue;
			half _SubsurfaceDirectValue;
			half _SubsurfaceAmbientValue;
			half _SubsurfaceShadowValue;
			half _IsVersion;
			half _MessageBounds;
			half _SpaceSubsurface;
			half _VertexVariationMode;
			half _HasEmissive;
			half _HasGradient;
			half _IsCustomShader;
			half _IsShared;
			half _IsCollected;
			half _IsIdentifier;
			half _HasOcclusion;
			half _IsTVEShader;
			half _RenderNormals;
			half _RenderMode;
			half _render_src;
			half _render_dst;
			half _render_zw;
			half _render_coverage;
			float _IsPlantShader;
			float _SubsurfaceDiffusion;
			half _SubsurfaceAngleValue;
			half _Cutoff;
			half _RenderSSR;
			half _RenderZWrite;
			half _RenderClip;
			half _RenderCull;
			half _RenderQueue;
			half _RenderPriority;
			half _RenderDecals;
			half _SubsurfaceNormalValue;
			half _SubsurfaceScatteringValue;
			half _MotionValue_30;
			half _EmissiveMode;
			half _IsLiteShader;
			half _DetailSnowMode;
			half _IsStandardShader;
			half _MotionPosition_10;
			float _MotionScale_10;
			half _EmissiveIntensityMode;
			float _MotionSpeed_10;
			half _MotionVariationMode;
			half _BoundsHeightValue;
			half _DetailAlphaMode;
			half _MotionScale_20;
			half _MotionVariation_20;
			half _MotionSpeed_20;
			half _MotionVariation_10;
			half _MotionAmplitude_20;
			half _EmissiveFlagMode;
			half _MessageOcclusion;
			half _MotionValue_20;
			half _MessageMainMask;
			half _MessageSecondMask;
			half _CategoryDetail;
			half _CategorySubsurface;
			half _CategoryEmissive;
			half _EmissiveIntensityValue;
			half _CategoryMotion;
			half _CategoryOcclusion;
			half _CategoryGradient;
			half _CategoryRender;
			half _CategoryMain;
			half _CategoryGlobals;
			half _MessageSubsurface;
			half _CategoryObject;
			half _AlphaClipValue;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);
			TEXTURE2D(_BumpMap);
			SAMPLER(sampler_BumpMap);
			TEXTURE2D(TVE_NoiseTex);
			half TVE_NoiseTexTilling;
			half4 TVE_MotionParams;
			half4 TVE_TimeParams;
			SAMPLER(sampler_Linear_Repeat);
			half4 TVE_WindEditor;
			half TVE_MotionValue_10;
			half TVE_MotionValue_20;
			half TVE_MotionValue_30;
			TEXTURE2D(_MainAlbedoTex);
			SAMPLER(sampler_MainAlbedoTex);
			TEXTURE2D(_SecondAlbedoTex);
			SAMPLER(sampler_SecondAlbedoTex);
			TEXTURE2D(_MainMaskTex);
			TEXTURE2D(_SecondMaskTex);
			TEXTURE2D(_MainNormalTex);


			
			struct SurfaceDescription
			{
				float Alpha;
				float AlphaClipThreshold;
			};

			VertexOutput VertexFunction(VertexInput v  )
			{
				VertexOutput o;
				ZERO_INITIALIZE(VertexOutput, o);

				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float3 VertexPosition3588_g80308 = v.positionOS.xyz;
				half3 Mesh_PivotsOS7730_g80308 = half3(0,0,0);
				float3 temp_output_7738_0_g80308 = ( VertexPosition3588_g80308 - Mesh_PivotsOS7730_g80308 );
				half3 VertexPos40_g80332 = temp_output_7738_0_g80308;
				half3 VertexPos40_g80333 = VertexPos40_g80332;
				float3 appendResult74_g80333 = (float3(VertexPos40_g80333.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g80333 = appendResult74_g80333;
				float3 break84_g80333 = VertexPos40_g80333;
				float3 appendResult81_g80333 = (float3(0.0 , break84_g80333.y , break84_g80333.z));
				half3 VertexPosOtherAxis82_g80333 = appendResult81_g80333;
				float3 ase_worldPos = TransformObjectToWorld( (v.positionOS).xyz );
				float3 vertexToFrag3890_g80308 = ase_worldPos;
				float3 WorldPosition3905_g80308 = vertexToFrag3890_g80308;
				float4x4 break19_g80338 = GetObjectToWorldMatrix();
				float3 appendResult20_g80338 = (float3(break19_g80338[ 0 ][ 3 ] , break19_g80338[ 1 ][ 3 ] , break19_g80338[ 2 ][ 3 ]));
				half3 ObjectData20_g80340 = appendResult20_g80338;
				half3 WorldData19_g80340 = ase_worldPos;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g80340 = WorldData19_g80340;
				#else
				float3 staticSwitch14_g80340 = ObjectData20_g80340;
				#endif
				float3 temp_output_114_0_g80338 = staticSwitch14_g80340;
				float3 vertexToFrag4224_g80308 = temp_output_114_0_g80338;
				float3 ObjectPosition4223_g80308 = vertexToFrag4224_g80308;
				float3 lerpResult7746_g80308 = lerp( WorldPosition3905_g80308 , ObjectPosition4223_g80308 , _MotionPosition_10);
				float3 Motion_10_Position7745_g80308 = lerpResult7746_g80308;
				half3 Input_Position419_g80317 = Motion_10_Position7745_g80308;
				float Input_MotionScale287_g80317 = ( _MotionScale_10 + 0.2 );
				half NoiseTex_Tilling735_g80317 = TVE_NoiseTexTilling;
				float2 temp_output_597_0_g80317 = (( Input_Position419_g80317 * Input_MotionScale287_g80317 * NoiseTex_Tilling735_g80317 * 0.0075 )).xz;
				float2 temp_output_447_0_g80373 = ((TVE_MotionParams).xy*2.0 + -1.0);
				half2 Global_Wind_DirectionWS4683_g80308 = temp_output_447_0_g80373;
				half2 Input_DirectionWS423_g80317 = Global_Wind_DirectionWS4683_g80308;
				float lerpResult128_g80318 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g80317 = _MotionSpeed_10;
				half Input_MotionVariation284_g80317 = _MotionVariation_10;
				half3 Input_Position167_g80354 = ObjectPosition4223_g80308;
				float dotResult156_g80354 = dot( (Input_Position167_g80354).xz , float2( 12.9898,78.233 ) );
				half Input_DynamicMode120_g80354 = 0.0;
				float Postion_Random162_g80354 = ( sin( dotResult156_g80354 ) * ( 1.0 - Input_DynamicMode120_g80354 ) );
				float4 break33_g80386 = _motion_variation_mode;
				float temp_output_30_0_g80386 = ( v.ase_color.r * break33_g80386.x );
				float temp_output_29_0_g80386 = ( v.ase_color.g * break33_g80386.y );
				float temp_output_31_0_g80386 = ( v.ase_color.b * break33_g80386.z );
				float lerpResult7828_g80308 = lerp( 0.0 , ( temp_output_30_0_g80386 + temp_output_29_0_g80386 + temp_output_31_0_g80386 + ( v.ase_color.a * break33_g80386.w ) ) , saturate( _MotionVariationMode ));
				float Mesh_Variation16_g80308 = lerpResult7828_g80308;
				half Input_Variation124_g80354 = Mesh_Variation16_g80308;
				half ObjectData20_g80356 = frac( ( Postion_Random162_g80354 + Input_Variation124_g80354 ) );
				half WorldData19_g80356 = Input_Variation124_g80354;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g80356 = WorldData19_g80356;
				#else
				float staticSwitch14_g80356 = ObjectData20_g80356;
				#endif
				float temp_output_112_0_g80354 = staticSwitch14_g80356;
				float clampResult171_g80354 = clamp( temp_output_112_0_g80354 , 0.01 , 0.99 );
				float Global_MeshVariation7760_g80308 = clampResult171_g80354;
				half Input_GlobalMeshVariation569_g80317 = Global_MeshVariation7760_g80308;
				float temp_output_630_0_g80317 = ( ( ( lerpResult128_g80318 * Input_MotionSpeed62_g80317 ) + ( Input_MotionVariation284_g80317 * Input_GlobalMeshVariation569_g80317 ) ) * 0.03 );
				float temp_output_607_0_g80317 = frac( temp_output_630_0_g80317 );
				float4 lerpResult590_g80317 = lerp( SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g80317 + ( -Input_DirectionWS423_g80317 * temp_output_607_0_g80317 ) ), 0.0 ) , SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g80317 + ( -Input_DirectionWS423_g80317 * frac( ( temp_output_630_0_g80317 + 0.5 ) ) ) ), 0.0 ) , ( abs( ( temp_output_607_0_g80317 - 0.5 ) ) / 0.5 ));
				half4 Noise_Complex703_g80317 = lerpResult590_g80317;
				float2 temp_output_645_0_g80317 = ((Noise_Complex703_g80317).rg*2.0 + -1.0);
				float2 break650_g80317 = temp_output_645_0_g80317;
				float3 appendResult649_g80317 = (float3(break650_g80317.x , 0.0 , break650_g80317.y));
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				half2 Global_Noise_OS5548_g80308 = (( mul( GetWorldToObjectMatrix(), float4( appendResult649_g80317 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_Noise_DirectionOS487_g80347 = Global_Noise_OS5548_g80308;
				float2 break448_g80373 = temp_output_447_0_g80373;
				float3 appendResult452_g80373 = (float3(break448_g80373.x , 0.0 , break448_g80373.y));
				half2 Global_Wind_DirectionOS5692_g80308 = (( mul( GetWorldToObjectMatrix(), float4( appendResult452_g80373 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_Wind_DirectionOS458_g80347 = Global_Wind_DirectionOS5692_g80308;
				float4 break322_g80373 = TVE_MotionParams;
				float lerpResult457_g80373 = lerp( break322_g80373.z , TVE_WindEditor.z , TVE_WindEditor.w);
				float temp_output_459_0_g80373 = ( 1.0 - lerpResult457_g80373 );
				half Global_Wind_Power2223_g80308 = ( 1.0 - ( temp_output_459_0_g80373 * temp_output_459_0_g80373 ) );
				half Input_WindPower449_g80347 = Global_Wind_Power2223_g80308;
				float2 lerpResult516_g80347 = lerp( Input_Noise_DirectionOS487_g80347 , Input_Wind_DirectionOS458_g80347 , ( Input_WindPower449_g80347 * 0.6 ));
				half Mesh_Height1524_g80308 = saturate( ( v.positionOS.xyz.y / _BoundsHeightValue ) );
				half Input_MeshHeight388_g80347 = Mesh_Height1524_g80308;
				half ObjectData20_g80348 = Input_MeshHeight388_g80347;
				half Input_BoundsHeight390_g80347 = 1.0;
				half WorldData19_g80348 = ( Input_MeshHeight388_g80347 * Input_MeshHeight388_g80347 * Input_BoundsHeight390_g80347 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g80348 = WorldData19_g80348;
				#else
				float staticSwitch14_g80348 = ObjectData20_g80348;
				#endif
				half Final_Motion10_Mask321_g80347 = ( staticSwitch14_g80348 * 2.0 );
				half Input_BendingAmplitude376_g80347 = _MotionAmplitude_10;
				half Global_MotionValue640_g80347 = TVE_MotionValue_10;
				half2 Final_Bending631_g80347 = ( lerpResult516_g80347 * ( Final_Motion10_Mask321_g80347 * Input_BendingAmplitude376_g80347 * Input_WindPower449_g80347 * Input_WindPower449_g80347 * Global_MotionValue640_g80347 ) );
				float2 break636_g80347 = Final_Bending631_g80347;
				float3 appendResult637_g80347 = (float3(break636_g80347.x , 0.0 , break636_g80347.y));
				half3 Motion_10_Bending216_g80308 = appendResult637_g80347;
				half3 Angle44_g80332 = Motion_10_Bending216_g80308;
				half Angle44_g80333 = (Angle44_g80332).z;
				half3 VertexPos40_g80334 = ( VertexPosRotationAxis50_g80333 + ( VertexPosOtherAxis82_g80333 * cos( Angle44_g80333 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g80333 ) * sin( Angle44_g80333 ) ) );
				float3 appendResult74_g80334 = (float3(0.0 , 0.0 , VertexPos40_g80334.z));
				half3 VertexPosRotationAxis50_g80334 = appendResult74_g80334;
				float3 break84_g80334 = VertexPos40_g80334;
				float3 appendResult81_g80334 = (float3(break84_g80334.x , break84_g80334.y , 0.0));
				half3 VertexPosOtherAxis82_g80334 = appendResult81_g80334;
				half Angle44_g80334 = -(Angle44_g80332).x;
				half3 Input_Position419_g80359 = WorldPosition3905_g80308;
				float3 break459_g80359 = Input_Position419_g80359;
				float Sum_Position446_g80359 = ( break459_g80359.x + break459_g80359.y + break459_g80359.z );
				half Input_MotionScale321_g80359 = ( _MotionScale_20 * 0.1 );
				half Input_MotionVariation330_g80359 = _MotionVariation_20;
				half Input_GlobalVariation400_g80359 = Global_MeshVariation7760_g80308;
				float lerpResult128_g80360 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g80359 = _MotionSpeed_20;
				float temp_output_404_0_g80359 = ( lerpResult128_g80360 * Input_MotionSpeed62_g80359 );
				half Motion_SineA450_g80359 = sin( ( ( Sum_Position446_g80359 * Input_MotionScale321_g80359 ) + ( Input_MotionVariation330_g80359 * Input_GlobalVariation400_g80359 ) + temp_output_404_0_g80359 ) );
				half Motion_SineB395_g80359 = sin( ( ( temp_output_404_0_g80359 * 0.6842 ) + ( Sum_Position446_g80359 * Input_MotionScale321_g80359 ) ) );
				half3 Input_Position419_g80345 = VertexPosition3588_g80308;
				float3 normalizeResult518_g80345 = normalize( Input_Position419_g80345 );
				half2 Input_DirectionOS423_g80345 = Global_Wind_DirectionOS5692_g80308;
				float2 break521_g80345 = -Input_DirectionOS423_g80345;
				float3 appendResult522_g80345 = (float3(break521_g80345.x , 0.0 , break521_g80345.y));
				float dotResult519_g80345 = dot( normalizeResult518_g80345 , appendResult522_g80345 );
				half Input_Value62_g80345 = _MotionFacingValue;
				float lerpResult524_g80345 = lerp( 1.0 , (dotResult519_g80345*0.5 + 0.5) , Input_Value62_g80345);
				half ObjectData20_g80346 = max( lerpResult524_g80345 , 0.001 );
				half WorldData19_g80346 = 1.0;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g80346 = WorldData19_g80346;
				#else
				float staticSwitch14_g80346 = ObjectData20_g80346;
				#endif
				half Motion_FacingMask7691_g80308 = staticSwitch14_g80346;
				half Motion_20_Amplitude7628_g80308 = Motion_FacingMask7691_g80308;
				half Input_MotionAmplitude384_g80359 = Motion_20_Amplitude7628_g80308;
				half Input_GlobalWind407_g80359 = Global_Wind_Power2223_g80308;
				float4 break638_g80317 = abs( Noise_Complex703_g80317 );
				half Global_Noise_B5526_g80308 = break638_g80317.b;
				half Input_GlobalNoise411_g80359 = Global_Noise_B5526_g80308;
				float lerpResult413_g80359 = lerp( 1.8 , 0.4 , Input_GlobalWind407_g80359);
				half Motion_Amplitude418_g80359 = ( Input_MotionAmplitude384_g80359 * Input_GlobalWind407_g80359 * pow( Input_GlobalNoise411_g80359 , lerpResult413_g80359 ) );
				half Input_Squash58_g80359 = _MotionAmplitude_20;
				float3 appendResult7790_g80308 = (float3(0.0 , v.positionOS.xyz.y , 0.0));
				half Mesh_Spherical7697_g80308 = saturate( ( distance( v.positionOS.xyz , appendResult7790_g80308 ) / _BoundsRadiusValue ) );
				float4 break33_g80370 = _motion_mask_mode_20;
				float temp_output_30_0_g80370 = ( v.ase_color.r * break33_g80370.x );
				float temp_output_29_0_g80370 = ( v.ase_color.g * break33_g80370.y );
				float temp_output_31_0_g80370 = ( v.ase_color.b * break33_g80370.z );
				float lerpResult7813_g80308 = lerp( Mesh_Spherical7697_g80308 , ( temp_output_30_0_g80370 + temp_output_29_0_g80370 + temp_output_31_0_g80370 + ( v.ase_color.a * break33_g80370.w ) ) , saturate( _MotionMaskMode_20 ));
				half Mesh_Motion_207834_g80308 = lerpResult7813_g80308;
				half Input_MeshMotion_20388_g80359 = Mesh_Motion_207834_g80308;
				half Input_BoundsRadius390_g80359 = 1.0;
				half Global_MotionValue462_g80359 = TVE_MotionValue_20;
				half2 Input_DirectionOS366_g80359 = Global_Wind_DirectionOS5692_g80308;
				float2 break371_g80359 = Input_DirectionOS366_g80359;
				float3 appendResult372_g80359 = (float3(break371_g80359.x , ( Motion_SineA450_g80359 * 0.3 ) , break371_g80359.y));
				half3 Motion_20_Squash7632_g80308 = ( ( (max( Motion_SineA450_g80359 , Motion_SineB395_g80359 )*0.5 + 0.5) * Motion_Amplitude418_g80359 * Input_Squash58_g80359 * Input_MeshMotion_20388_g80359 * Input_BoundsRadius390_g80359 * Global_MotionValue462_g80359 ) * appendResult372_g80359 );
				half3 VertexPos40_g80321 = ( ( VertexPosRotationAxis50_g80334 + ( VertexPosOtherAxis82_g80334 * cos( Angle44_g80334 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g80334 ) * sin( Angle44_g80334 ) ) ) + Motion_20_Squash7632_g80308 );
				float3 appendResult74_g80321 = (float3(0.0 , VertexPos40_g80321.y , 0.0));
				float3 VertexPosRotationAxis50_g80321 = appendResult74_g80321;
				float3 break84_g80321 = VertexPos40_g80321;
				float3 appendResult81_g80321 = (float3(break84_g80321.x , 0.0 , break84_g80321.z));
				float3 VertexPosOtherAxis82_g80321 = appendResult81_g80321;
				half Input_Rolling379_g80359 = _MotionAmplitude_22;
				half Motion_20_Rolling7633_g80308 = ( Motion_SineA450_g80359 * Motion_Amplitude418_g80359 * Input_Rolling379_g80359 * Input_MeshMotion_20388_g80359 * Global_MotionValue462_g80359 );
				half Angle44_g80321 = Motion_20_Rolling7633_g80308;
				half3 Input_Position500_g80326 = WorldPosition3905_g80308;
				half Input_MotionScale321_g80326 = _MotionScale_32;
				half Input_MotionVariation330_g80326 = _MotionVariation_32;
				half Input_GlobalVariation372_g80326 = Global_MeshVariation7760_g80308;
				float lerpResult128_g80327 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g80326 = _MotionSpeed_32;
				float4 tex2DNode460_g80326 = SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( ( (Input_Position500_g80326).xz * Input_MotionScale321_g80326 * 0.03 ) + ( Input_MotionVariation330_g80326 * Input_GlobalVariation372_g80326 ) + ( lerpResult128_g80327 * Input_MotionSpeed62_g80326 * 0.02 ) ), 0.0 );
				float3 appendResult462_g80326 = (float3(tex2DNode460_g80326.r , tex2DNode460_g80326.g , tex2DNode460_g80326.b));
				half3 Flutter_Texture489_g80326 = (appendResult462_g80326*2.0 + -1.0);
				half Motion_30_Amplitude7534_g80308 = ( _MotionAmplitude_32 * Motion_FacingMask7691_g80308 );
				half Input_MotionAmplitude58_g80326 = Motion_30_Amplitude7534_g80308;
				float4 break33_g80369 = _motion_mask_mode_30;
				float temp_output_30_0_g80369 = ( v.ase_color.r * break33_g80369.x );
				float temp_output_29_0_g80369 = ( v.ase_color.g * break33_g80369.y );
				float temp_output_31_0_g80369 = ( v.ase_color.b * break33_g80369.z );
				float lerpResult7820_g80308 = lerp( v.ase_texcoord.y , ( temp_output_30_0_g80369 + temp_output_29_0_g80369 + temp_output_31_0_g80369 + ( v.ase_color.a * break33_g80369.w ) ) , saturate( _MotionMaskMode_30 ));
				half Mesh_Motion_30144_g80308 = lerpResult7820_g80308;
				half Input_MeshMotion_30374_g80326 = Mesh_Motion_30144_g80308;
				half Input_GlobalWind471_g80326 = Global_Wind_Power2223_g80308;
				half Global_MotionValue503_g80326 = TVE_MotionValue_30;
				half Input_GlobalNoise472_g80326 = Global_Noise_B5526_g80308;
				float lerpResult466_g80326 = lerp( 2.4 , 0.6 , Input_GlobalWind471_g80326);
				half Flutter_Amplitude491_g80326 = ( Input_MotionAmplitude58_g80326 * Input_MeshMotion_30374_g80326 * Input_GlobalWind471_g80326 * Global_MotionValue503_g80326 * pow( Input_GlobalNoise472_g80326 , lerpResult466_g80326 ) );
				half3 Motion_30_Flutter263_g80308 = ( Flutter_Texture489_g80326 * Flutter_Amplitude491_g80326 );
				float3 Vertex_Motion_Object7655_g80308 = ( ( ( VertexPosRotationAxis50_g80321 + ( VertexPosOtherAxis82_g80321 * cos( Angle44_g80321 ) ) + ( cross( float3(0,1,0) , VertexPosOtherAxis82_g80321 ) * sin( Angle44_g80321 ) ) ) + Motion_30_Flutter263_g80308 ) + Mesh_PivotsOS7730_g80308 );
				float3 Final_VertexPosition890_g80308 = Vertex_Motion_Object7655_g80308;
				
				float4 break33_g80365 = _second_uvs_mode;
				float2 temp_output_30_0_g80365 = ( v.ase_texcoord.xy * break33_g80365.x );
				float2 temp_output_29_0_g80365 = ( v.ase_texcoord3.xy * break33_g80365.y );
				float2 temp_output_31_0_g80365 = ( (WorldPosition3905_g80308).xz * break33_g80365.z );
				half2 Second_UVs_Tilling7781_g80308 = (_SecondUVs).xy;
				half2 Second_UVs_Scale7782_g80308 = ( 1.0 / Second_UVs_Tilling7781_g80308 );
				float2 lerpResult7786_g80308 = lerp( Second_UVs_Tilling7781_g80308 , Second_UVs_Scale7782_g80308 , _SecondUVsScaleMode);
				half2 Second_UVs_Offset7777_g80308 = (_SecondUVs).zw;
				float2 vertexToFrag11_g80309 = ( ( ( temp_output_30_0_g80365 + temp_output_29_0_g80365 + temp_output_31_0_g80365 ) * lerpResult7786_g80308 ) + Second_UVs_Offset7777_g80308 );
				o.ase_texcoord.zw = vertexToFrag11_g80309;
				float3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				o.ase_texcoord1.xyz = ase_worldTangent;
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				o.ase_texcoord2.xyz = ase_worldNormal;
				float ase_vertexTangentSign = v.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord3.xyz = ase_worldBitangent;
				
				o.ase_texcoord.xy = v.ase_texcoord.xy;
				o.ase_color = v.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord1.w = 0;
				o.ase_texcoord2.w = 0;
				o.ase_texcoord3.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = Final_VertexPosition890_g80308;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.positionOS.xyz = vertexValue;
				#else
					v.positionOS.xyz += vertexValue;
				#endif

				v.normalOS = v.normalOS;

				float3 positionWS = TransformObjectToWorld( v.positionOS.xyz );

				o.positionCS = TransformWorldToHClip(positionWS);

				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_tangent : TANGENT;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.positionOS;
				o.normalOS = v.normalOS;
				o.ase_color = v.ase_color;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_texcoord3 = v.ase_texcoord3;
				o.ase_tangent = v.ase_tangent;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.positionOS = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].vertex.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(VertexOutput IN ) : SV_TARGET
			{
				SurfaceDescription surfaceDescription = (SurfaceDescription)0;

				float localCustomAlphaClip19_g80314 = ( 0.0 );
				half2 Main_UVs15_g80308 = ( ( IN.ase_texcoord.xy * (_MainUVs).xy ) + (_MainUVs).zw );
				float4 tex2DNode29_g80308 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs15_g80308 );
				half Main_Alpha316_g80308 = tex2DNode29_g80308.a;
				float2 vertexToFrag11_g80309 = IN.ase_texcoord.zw;
				half2 Second_UVs17_g80308 = vertexToFrag11_g80309;
				float4 tex2DNode89_g80308 = SAMPLE_TEXTURE2D( _SecondAlbedoTex, sampler_SecondAlbedoTex, Second_UVs17_g80308 );
				half Second_Alpha5007_g80308 = tex2DNode89_g80308.a;
				float4 tex2DNode35_g80308 = SAMPLE_TEXTURE2D( _MainMaskTex, sampler_Linear_Repeat, Main_UVs15_g80308 );
				half Main_Mask57_g80308 = tex2DNode35_g80308.b;
				float4 tex2DNode33_g80308 = SAMPLE_TEXTURE2D( _SecondMaskTex, sampler_Linear_Repeat, Second_UVs17_g80308 );
				half Second_Mask81_g80308 = tex2DNode33_g80308.b;
				float lerpResult6885_g80308 = lerp( Main_Mask57_g80308 , Second_Mask81_g80308 , _DetailMaskMode);
				float clampResult17_g80325 = clamp( lerpResult6885_g80308 , 0.0001 , 0.9999 );
				float temp_output_7_0_g80324 = _DetailMaskMinValue;
				float temp_output_10_0_g80324 = ( _DetailMaskMaxValue - temp_output_7_0_g80324 );
				half Blend_Mask_Texture6794_g80308 = saturate( ( ( clampResult17_g80325 - temp_output_7_0_g80324 ) / ( temp_output_10_0_g80324 + 0.0001 ) ) );
				half4 Normal_Packed45_g80375 = SAMPLE_TEXTURE2D( _MainNormalTex, sampler_Linear_Repeat, Main_UVs15_g80308 );
				float2 appendResult58_g80375 = (float2(( (Normal_Packed45_g80375).x * (Normal_Packed45_g80375).w ) , (Normal_Packed45_g80375).y));
				half2 Normal_Default50_g80375 = appendResult58_g80375;
				half2 Normal_ASTC41_g80375 = (Normal_Packed45_g80375).xy;
				#ifdef UNITY_ASTC_NORMALMAP_ENCODING
				float2 staticSwitch38_g80375 = Normal_ASTC41_g80375;
				#else
				float2 staticSwitch38_g80375 = Normal_Default50_g80375;
				#endif
				half2 Normal_NO_DTX544_g80375 = (Normal_Packed45_g80375).wy;
				#ifdef UNITY_NO_DXT5nm
				float2 staticSwitch37_g80375 = Normal_NO_DTX544_g80375;
				#else
				float2 staticSwitch37_g80375 = staticSwitch38_g80375;
				#endif
				float2 temp_output_6555_0_g80308 = ( (staticSwitch37_g80375*2.0 + -1.0) * _MainNormalValue );
				float3 appendResult7388_g80308 = (float3(temp_output_6555_0_g80308 , 1.0));
				float3 ase_worldTangent = IN.ase_texcoord1.xyz;
				float3 ase_worldNormal = IN.ase_texcoord2.xyz;
				float3 ase_worldBitangent = IN.ase_texcoord3.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 tanNormal7389_g80308 = appendResult7388_g80308;
				float3 worldNormal7389_g80308 = float3(dot(tanToWorld0,tanNormal7389_g80308), dot(tanToWorld1,tanNormal7389_g80308), dot(tanToWorld2,tanNormal7389_g80308));
				half3 Main_NormalWS7390_g80308 = worldNormal7389_g80308;
				float4 break33_g80385 = _detail_mesh_mode;
				float temp_output_30_0_g80385 = ( IN.ase_color.r * break33_g80385.x );
				float temp_output_29_0_g80385 = ( IN.ase_color.g * break33_g80385.y );
				float temp_output_31_0_g80385 = ( IN.ase_color.b * break33_g80385.z );
				float lerpResult7836_g80308 = lerp( ((Main_NormalWS7390_g80308).y*0.5 + 0.5) , ( temp_output_30_0_g80385 + temp_output_29_0_g80385 + temp_output_31_0_g80385 + ( IN.ase_color.a * break33_g80385.w ) ) , saturate( _DetailMeshMode ));
				float clampResult17_g80323 = clamp( lerpResult7836_g80308 , 0.0001 , 0.9999 );
				float temp_output_7_0_g80322 = _DetailMeshMinValue;
				float temp_output_10_0_g80322 = ( _DetailMeshMaxValue - temp_output_7_0_g80322 );
				half Blend_Mask_Mesh1540_g80308 = saturate( ( ( clampResult17_g80323 - temp_output_7_0_g80322 ) / ( temp_output_10_0_g80322 + 0.0001 ) ) );
				float clampResult17_g80352 = clamp( ( Blend_Mask_Texture6794_g80308 * Blend_Mask_Mesh1540_g80308 ) , 0.0001 , 0.9999 );
				float temp_output_7_0_g80353 = _DetailBlendMinValue;
				float temp_output_10_0_g80353 = ( _DetailBlendMaxValue - temp_output_7_0_g80353 );
				half Blend_Mask147_g80308 = ( saturate( ( ( clampResult17_g80352 - temp_output_7_0_g80353 ) / ( temp_output_10_0_g80353 + 0.0001 ) ) ) * _DetailMode * _DetailValue );
				float lerpResult6153_g80308 = lerp( Main_Alpha316_g80308 , Second_Alpha5007_g80308 , Blend_Mask147_g80308);
				float lerpResult6785_g80308 = lerp( ( Main_Alpha316_g80308 * Second_Alpha5007_g80308 ) , lerpResult6153_g80308 , _DetailAlphaMode);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch6158_g80308 = lerpResult6785_g80308;
				#else
				float staticSwitch6158_g80308 = Main_Alpha316_g80308;
				#endif
				half Blend_Alpha6157_g80308 = staticSwitch6158_g80308;
				half AlphaTreshold2132_g80308 = _AlphaClipValue;
				float temp_output_3_0_g80314 = ( Blend_Alpha6157_g80308 - AlphaTreshold2132_g80308 );
				float Alpha19_g80314 = temp_output_3_0_g80314;
				float temp_output_15_0_g80314 = 0.01;
				float Treshold19_g80314 = temp_output_15_0_g80314;
				{
				#if defined (TVE_FEATURE_CLIP)
				#if defined (TVE_IS_HD_PIPELINE)
				#if !defined(SHADERPASS_FORWARD_BYPASS_ALPHA_TEST) && !defined(SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST)
				clip(Alpha19_g80314 - Treshold19_g80314);
				#endif
				#else
				clip(Alpha19_g80314 - Treshold19_g80314);
				#endif
				#endif
				}
				half Final_Clip914_g80308 = Alpha19_g80314;
				

				surfaceDescription.Alpha = Final_Clip914_g80308;
				surfaceDescription.AlphaClipThreshold = 0.5;

				#if _ALPHATEST_ON
					float alphaClipThreshold = 0.01f;
					#if ALPHA_CLIP_THRESHOLD
						alphaClipThreshold = surfaceDescription.AlphaClipThreshold;
					#endif
					clip(surfaceDescription.Alpha - alphaClipThreshold);
				#endif

				half4 outColor = 0;

				#ifdef SCENESELECTIONPASS
					outColor = half4(_ObjectId, _PassValue, 1.0, 1.0);
				#elif defined(SCENEPICKINGPASS)
					outColor = _SelectionID;
				#endif

				return outColor;
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "ScenePickingPass"
			Tags { "LightMode"="Picking" }

			AlphaToMask Off

			HLSLPROGRAM

			#define _NORMAL_DROPOFF_TS 1
			#define ASE_FOG 1
			#define _SPECULAR_SETUP 1
			#define ASE_ABSOLUTE_VERTEX_POS 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140007
			#define ASE_USING_SAMPLING_MACROS 1


			#pragma vertex vert
			#pragma fragment frag

		    #define SCENEPICKINGPASS 1

			#define ATTRIBUTES_NEED_NORMAL
			#define ATTRIBUTES_NEED_TANGENT
			#define SHADERPASS SHADERPASS_DEPTHONLY

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_COLOR
			#pragma shader_feature_local_fragment TVE_FEATURE_CLIP
			#pragma shader_feature_local TVE_FEATURE_DETAIL
			#define TVE_IS_PLANT_SHADER
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END
			#define TVE_IS_STANDARD_SHADER
			#define THE_VEGETATION_ENGINE
			#define TVE_IS_UNIVERSAL_PIPELINE


			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_tangent : TANGENT;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 positionCS : SV_POSITION;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _EmissiveTexRemap;
			half4 _GradientColorOne;
			half4 _GradientColorTwo;
			half4 _VertexOcclusionRemap;
			half4 _DetailBlendRemap;
			half4 _VertexOcclusionColor;
			half4 _vertex_occlusion_mask_mode;
			half4 _SecondUVs;
			float4 _GradientMaskRemap;
			half4 _second_uvs_mode;
			half4 _SecondColorTwo;
			half4 _SecondColor;
			half4 _MainColor;
			half4 _MainColorTwo;
			half4 _motion_mask_mode_20;
			half4 _DetailMeshRemap;
			half4 _SubsurfaceColor;
			float4 _SubsurfaceDiffusion_Asset;
			half4 _detail_mesh_mode;
			half4 _SecondMaskRemap;
			half4 _MainMaskRemap;
			float4 _Color;
			half4 _MainUVs;
			half4 _motion_variation_mode;
			half4 _DetailMaskRemap;
			half4 _motion_mask_mode_30;
			half4 _EmissiveUVs;
			half4 _EmissiveColor;
			half3 _render_normals;
			half _DetailBlendMode;
			half _SecondMaskMinValue;
			half _DetailMaskMode;
			half _SecondColorMode;
			half _SecondMaskMaxValue;
			half _render_cull;
			half _SecondUVsScaleMode;
			half _MainColorMode;
			half _MainMaskMaxValue;
			half _MainMaskMinValue;
			half _MainAlbedoValue;
			half _MotionMaskMode_30;
			half _MotionAmplitude_32;
			float _MotionSpeed_32;
			float _MotionVariation_32;
			float _MotionScale_32;
			half _MotionAmplitude_22;
			half _MotionMaskMode_20;
			half _SecondAlbedoValue;
			half _DetailMaskMinValue;
			half _DetailBlendMinValue;
			half _MainNormalValue;
			half _SecondOcclusionValue;
			half _MainOcclusionValue;
			half _SecondSmoothnessValue;
			half _MainSmoothnessValue;
			half _RenderSpecular;
			float _emissive_intensity_value;
			half _EmissiveTexMaxValue;
			half _EmissiveTexMinValue;
			half _SubsurfaceMaskValue;
			half _SubsurfaceValue;
			half _VertexOcclusionOverlayMode;
			half _OverlayProjectionValue;
			half _SecondNormalValue;
			half _SecondUVsMode;
			half _DetailNormalValue;
			half _GlobalOverlay;
			half _VertexOcclusionMaxValue;
			half _VertexOcclusionMinValue;
			half _VertexOcclusionMaskMode;
			half _GradientMaxValue;
			half _GradientMinValue;
			half _DetailValue;
			half _DetailMode;
			half _DetailBlendMaxValue;
			half _DetailMeshMaxValue;
			half _DetailMeshMinValue;
			half _DetailMeshMode;
			half _DetailMaskMaxValue;
			half _BoundsRadiusValue;
			half _MotionAmplitude_10;
			half _MotionFacingValue;
			half _SubsurfaceDirectValue;
			half _SubsurfaceAmbientValue;
			half _SubsurfaceShadowValue;
			half _IsVersion;
			half _MessageBounds;
			half _SpaceSubsurface;
			half _VertexVariationMode;
			half _HasEmissive;
			half _HasGradient;
			half _IsCustomShader;
			half _IsShared;
			half _IsCollected;
			half _IsIdentifier;
			half _HasOcclusion;
			half _IsTVEShader;
			half _RenderNormals;
			half _RenderMode;
			half _render_src;
			half _render_dst;
			half _render_zw;
			half _render_coverage;
			float _IsPlantShader;
			float _SubsurfaceDiffusion;
			half _SubsurfaceAngleValue;
			half _Cutoff;
			half _RenderSSR;
			half _RenderZWrite;
			half _RenderClip;
			half _RenderCull;
			half _RenderQueue;
			half _RenderPriority;
			half _RenderDecals;
			half _SubsurfaceNormalValue;
			half _SubsurfaceScatteringValue;
			half _MotionValue_30;
			half _EmissiveMode;
			half _IsLiteShader;
			half _DetailSnowMode;
			half _IsStandardShader;
			half _MotionPosition_10;
			float _MotionScale_10;
			half _EmissiveIntensityMode;
			float _MotionSpeed_10;
			half _MotionVariationMode;
			half _BoundsHeightValue;
			half _DetailAlphaMode;
			half _MotionScale_20;
			half _MotionVariation_20;
			half _MotionSpeed_20;
			half _MotionVariation_10;
			half _MotionAmplitude_20;
			half _EmissiveFlagMode;
			half _MessageOcclusion;
			half _MotionValue_20;
			half _MessageMainMask;
			half _MessageSecondMask;
			half _CategoryDetail;
			half _CategorySubsurface;
			half _CategoryEmissive;
			half _EmissiveIntensityValue;
			half _CategoryMotion;
			half _CategoryOcclusion;
			half _CategoryGradient;
			half _CategoryRender;
			half _CategoryMain;
			half _CategoryGlobals;
			half _MessageSubsurface;
			half _CategoryObject;
			half _AlphaClipValue;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);
			TEXTURE2D(_BumpMap);
			SAMPLER(sampler_BumpMap);
			TEXTURE2D(TVE_NoiseTex);
			half TVE_NoiseTexTilling;
			half4 TVE_MotionParams;
			half4 TVE_TimeParams;
			SAMPLER(sampler_Linear_Repeat);
			half4 TVE_WindEditor;
			half TVE_MotionValue_10;
			half TVE_MotionValue_20;
			half TVE_MotionValue_30;
			TEXTURE2D(_MainAlbedoTex);
			SAMPLER(sampler_MainAlbedoTex);
			TEXTURE2D(_SecondAlbedoTex);
			SAMPLER(sampler_SecondAlbedoTex);
			TEXTURE2D(_MainMaskTex);
			TEXTURE2D(_SecondMaskTex);
			TEXTURE2D(_MainNormalTex);


			
			struct SurfaceDescription
			{
				float Alpha;
				float AlphaClipThreshold;
			};

			VertexOutput VertexFunction(VertexInput v  )
			{
				VertexOutput o;
				ZERO_INITIALIZE(VertexOutput, o);

				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float3 VertexPosition3588_g80308 = v.positionOS.xyz;
				half3 Mesh_PivotsOS7730_g80308 = half3(0,0,0);
				float3 temp_output_7738_0_g80308 = ( VertexPosition3588_g80308 - Mesh_PivotsOS7730_g80308 );
				half3 VertexPos40_g80332 = temp_output_7738_0_g80308;
				half3 VertexPos40_g80333 = VertexPos40_g80332;
				float3 appendResult74_g80333 = (float3(VertexPos40_g80333.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g80333 = appendResult74_g80333;
				float3 break84_g80333 = VertexPos40_g80333;
				float3 appendResult81_g80333 = (float3(0.0 , break84_g80333.y , break84_g80333.z));
				half3 VertexPosOtherAxis82_g80333 = appendResult81_g80333;
				float3 ase_worldPos = TransformObjectToWorld( (v.positionOS).xyz );
				float3 vertexToFrag3890_g80308 = ase_worldPos;
				float3 WorldPosition3905_g80308 = vertexToFrag3890_g80308;
				float4x4 break19_g80338 = GetObjectToWorldMatrix();
				float3 appendResult20_g80338 = (float3(break19_g80338[ 0 ][ 3 ] , break19_g80338[ 1 ][ 3 ] , break19_g80338[ 2 ][ 3 ]));
				half3 ObjectData20_g80340 = appendResult20_g80338;
				half3 WorldData19_g80340 = ase_worldPos;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g80340 = WorldData19_g80340;
				#else
				float3 staticSwitch14_g80340 = ObjectData20_g80340;
				#endif
				float3 temp_output_114_0_g80338 = staticSwitch14_g80340;
				float3 vertexToFrag4224_g80308 = temp_output_114_0_g80338;
				float3 ObjectPosition4223_g80308 = vertexToFrag4224_g80308;
				float3 lerpResult7746_g80308 = lerp( WorldPosition3905_g80308 , ObjectPosition4223_g80308 , _MotionPosition_10);
				float3 Motion_10_Position7745_g80308 = lerpResult7746_g80308;
				half3 Input_Position419_g80317 = Motion_10_Position7745_g80308;
				float Input_MotionScale287_g80317 = ( _MotionScale_10 + 0.2 );
				half NoiseTex_Tilling735_g80317 = TVE_NoiseTexTilling;
				float2 temp_output_597_0_g80317 = (( Input_Position419_g80317 * Input_MotionScale287_g80317 * NoiseTex_Tilling735_g80317 * 0.0075 )).xz;
				float2 temp_output_447_0_g80373 = ((TVE_MotionParams).xy*2.0 + -1.0);
				half2 Global_Wind_DirectionWS4683_g80308 = temp_output_447_0_g80373;
				half2 Input_DirectionWS423_g80317 = Global_Wind_DirectionWS4683_g80308;
				float lerpResult128_g80318 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g80317 = _MotionSpeed_10;
				half Input_MotionVariation284_g80317 = _MotionVariation_10;
				half3 Input_Position167_g80354 = ObjectPosition4223_g80308;
				float dotResult156_g80354 = dot( (Input_Position167_g80354).xz , float2( 12.9898,78.233 ) );
				half Input_DynamicMode120_g80354 = 0.0;
				float Postion_Random162_g80354 = ( sin( dotResult156_g80354 ) * ( 1.0 - Input_DynamicMode120_g80354 ) );
				float4 break33_g80386 = _motion_variation_mode;
				float temp_output_30_0_g80386 = ( v.ase_color.r * break33_g80386.x );
				float temp_output_29_0_g80386 = ( v.ase_color.g * break33_g80386.y );
				float temp_output_31_0_g80386 = ( v.ase_color.b * break33_g80386.z );
				float lerpResult7828_g80308 = lerp( 0.0 , ( temp_output_30_0_g80386 + temp_output_29_0_g80386 + temp_output_31_0_g80386 + ( v.ase_color.a * break33_g80386.w ) ) , saturate( _MotionVariationMode ));
				float Mesh_Variation16_g80308 = lerpResult7828_g80308;
				half Input_Variation124_g80354 = Mesh_Variation16_g80308;
				half ObjectData20_g80356 = frac( ( Postion_Random162_g80354 + Input_Variation124_g80354 ) );
				half WorldData19_g80356 = Input_Variation124_g80354;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g80356 = WorldData19_g80356;
				#else
				float staticSwitch14_g80356 = ObjectData20_g80356;
				#endif
				float temp_output_112_0_g80354 = staticSwitch14_g80356;
				float clampResult171_g80354 = clamp( temp_output_112_0_g80354 , 0.01 , 0.99 );
				float Global_MeshVariation7760_g80308 = clampResult171_g80354;
				half Input_GlobalMeshVariation569_g80317 = Global_MeshVariation7760_g80308;
				float temp_output_630_0_g80317 = ( ( ( lerpResult128_g80318 * Input_MotionSpeed62_g80317 ) + ( Input_MotionVariation284_g80317 * Input_GlobalMeshVariation569_g80317 ) ) * 0.03 );
				float temp_output_607_0_g80317 = frac( temp_output_630_0_g80317 );
				float4 lerpResult590_g80317 = lerp( SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g80317 + ( -Input_DirectionWS423_g80317 * temp_output_607_0_g80317 ) ), 0.0 ) , SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g80317 + ( -Input_DirectionWS423_g80317 * frac( ( temp_output_630_0_g80317 + 0.5 ) ) ) ), 0.0 ) , ( abs( ( temp_output_607_0_g80317 - 0.5 ) ) / 0.5 ));
				half4 Noise_Complex703_g80317 = lerpResult590_g80317;
				float2 temp_output_645_0_g80317 = ((Noise_Complex703_g80317).rg*2.0 + -1.0);
				float2 break650_g80317 = temp_output_645_0_g80317;
				float3 appendResult649_g80317 = (float3(break650_g80317.x , 0.0 , break650_g80317.y));
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				half2 Global_Noise_OS5548_g80308 = (( mul( GetWorldToObjectMatrix(), float4( appendResult649_g80317 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_Noise_DirectionOS487_g80347 = Global_Noise_OS5548_g80308;
				float2 break448_g80373 = temp_output_447_0_g80373;
				float3 appendResult452_g80373 = (float3(break448_g80373.x , 0.0 , break448_g80373.y));
				half2 Global_Wind_DirectionOS5692_g80308 = (( mul( GetWorldToObjectMatrix(), float4( appendResult452_g80373 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_Wind_DirectionOS458_g80347 = Global_Wind_DirectionOS5692_g80308;
				float4 break322_g80373 = TVE_MotionParams;
				float lerpResult457_g80373 = lerp( break322_g80373.z , TVE_WindEditor.z , TVE_WindEditor.w);
				float temp_output_459_0_g80373 = ( 1.0 - lerpResult457_g80373 );
				half Global_Wind_Power2223_g80308 = ( 1.0 - ( temp_output_459_0_g80373 * temp_output_459_0_g80373 ) );
				half Input_WindPower449_g80347 = Global_Wind_Power2223_g80308;
				float2 lerpResult516_g80347 = lerp( Input_Noise_DirectionOS487_g80347 , Input_Wind_DirectionOS458_g80347 , ( Input_WindPower449_g80347 * 0.6 ));
				half Mesh_Height1524_g80308 = saturate( ( v.positionOS.xyz.y / _BoundsHeightValue ) );
				half Input_MeshHeight388_g80347 = Mesh_Height1524_g80308;
				half ObjectData20_g80348 = Input_MeshHeight388_g80347;
				half Input_BoundsHeight390_g80347 = 1.0;
				half WorldData19_g80348 = ( Input_MeshHeight388_g80347 * Input_MeshHeight388_g80347 * Input_BoundsHeight390_g80347 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g80348 = WorldData19_g80348;
				#else
				float staticSwitch14_g80348 = ObjectData20_g80348;
				#endif
				half Final_Motion10_Mask321_g80347 = ( staticSwitch14_g80348 * 2.0 );
				half Input_BendingAmplitude376_g80347 = _MotionAmplitude_10;
				half Global_MotionValue640_g80347 = TVE_MotionValue_10;
				half2 Final_Bending631_g80347 = ( lerpResult516_g80347 * ( Final_Motion10_Mask321_g80347 * Input_BendingAmplitude376_g80347 * Input_WindPower449_g80347 * Input_WindPower449_g80347 * Global_MotionValue640_g80347 ) );
				float2 break636_g80347 = Final_Bending631_g80347;
				float3 appendResult637_g80347 = (float3(break636_g80347.x , 0.0 , break636_g80347.y));
				half3 Motion_10_Bending216_g80308 = appendResult637_g80347;
				half3 Angle44_g80332 = Motion_10_Bending216_g80308;
				half Angle44_g80333 = (Angle44_g80332).z;
				half3 VertexPos40_g80334 = ( VertexPosRotationAxis50_g80333 + ( VertexPosOtherAxis82_g80333 * cos( Angle44_g80333 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g80333 ) * sin( Angle44_g80333 ) ) );
				float3 appendResult74_g80334 = (float3(0.0 , 0.0 , VertexPos40_g80334.z));
				half3 VertexPosRotationAxis50_g80334 = appendResult74_g80334;
				float3 break84_g80334 = VertexPos40_g80334;
				float3 appendResult81_g80334 = (float3(break84_g80334.x , break84_g80334.y , 0.0));
				half3 VertexPosOtherAxis82_g80334 = appendResult81_g80334;
				half Angle44_g80334 = -(Angle44_g80332).x;
				half3 Input_Position419_g80359 = WorldPosition3905_g80308;
				float3 break459_g80359 = Input_Position419_g80359;
				float Sum_Position446_g80359 = ( break459_g80359.x + break459_g80359.y + break459_g80359.z );
				half Input_MotionScale321_g80359 = ( _MotionScale_20 * 0.1 );
				half Input_MotionVariation330_g80359 = _MotionVariation_20;
				half Input_GlobalVariation400_g80359 = Global_MeshVariation7760_g80308;
				float lerpResult128_g80360 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g80359 = _MotionSpeed_20;
				float temp_output_404_0_g80359 = ( lerpResult128_g80360 * Input_MotionSpeed62_g80359 );
				half Motion_SineA450_g80359 = sin( ( ( Sum_Position446_g80359 * Input_MotionScale321_g80359 ) + ( Input_MotionVariation330_g80359 * Input_GlobalVariation400_g80359 ) + temp_output_404_0_g80359 ) );
				half Motion_SineB395_g80359 = sin( ( ( temp_output_404_0_g80359 * 0.6842 ) + ( Sum_Position446_g80359 * Input_MotionScale321_g80359 ) ) );
				half3 Input_Position419_g80345 = VertexPosition3588_g80308;
				float3 normalizeResult518_g80345 = normalize( Input_Position419_g80345 );
				half2 Input_DirectionOS423_g80345 = Global_Wind_DirectionOS5692_g80308;
				float2 break521_g80345 = -Input_DirectionOS423_g80345;
				float3 appendResult522_g80345 = (float3(break521_g80345.x , 0.0 , break521_g80345.y));
				float dotResult519_g80345 = dot( normalizeResult518_g80345 , appendResult522_g80345 );
				half Input_Value62_g80345 = _MotionFacingValue;
				float lerpResult524_g80345 = lerp( 1.0 , (dotResult519_g80345*0.5 + 0.5) , Input_Value62_g80345);
				half ObjectData20_g80346 = max( lerpResult524_g80345 , 0.001 );
				half WorldData19_g80346 = 1.0;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g80346 = WorldData19_g80346;
				#else
				float staticSwitch14_g80346 = ObjectData20_g80346;
				#endif
				half Motion_FacingMask7691_g80308 = staticSwitch14_g80346;
				half Motion_20_Amplitude7628_g80308 = Motion_FacingMask7691_g80308;
				half Input_MotionAmplitude384_g80359 = Motion_20_Amplitude7628_g80308;
				half Input_GlobalWind407_g80359 = Global_Wind_Power2223_g80308;
				float4 break638_g80317 = abs( Noise_Complex703_g80317 );
				half Global_Noise_B5526_g80308 = break638_g80317.b;
				half Input_GlobalNoise411_g80359 = Global_Noise_B5526_g80308;
				float lerpResult413_g80359 = lerp( 1.8 , 0.4 , Input_GlobalWind407_g80359);
				half Motion_Amplitude418_g80359 = ( Input_MotionAmplitude384_g80359 * Input_GlobalWind407_g80359 * pow( Input_GlobalNoise411_g80359 , lerpResult413_g80359 ) );
				half Input_Squash58_g80359 = _MotionAmplitude_20;
				float3 appendResult7790_g80308 = (float3(0.0 , v.positionOS.xyz.y , 0.0));
				half Mesh_Spherical7697_g80308 = saturate( ( distance( v.positionOS.xyz , appendResult7790_g80308 ) / _BoundsRadiusValue ) );
				float4 break33_g80370 = _motion_mask_mode_20;
				float temp_output_30_0_g80370 = ( v.ase_color.r * break33_g80370.x );
				float temp_output_29_0_g80370 = ( v.ase_color.g * break33_g80370.y );
				float temp_output_31_0_g80370 = ( v.ase_color.b * break33_g80370.z );
				float lerpResult7813_g80308 = lerp( Mesh_Spherical7697_g80308 , ( temp_output_30_0_g80370 + temp_output_29_0_g80370 + temp_output_31_0_g80370 + ( v.ase_color.a * break33_g80370.w ) ) , saturate( _MotionMaskMode_20 ));
				half Mesh_Motion_207834_g80308 = lerpResult7813_g80308;
				half Input_MeshMotion_20388_g80359 = Mesh_Motion_207834_g80308;
				half Input_BoundsRadius390_g80359 = 1.0;
				half Global_MotionValue462_g80359 = TVE_MotionValue_20;
				half2 Input_DirectionOS366_g80359 = Global_Wind_DirectionOS5692_g80308;
				float2 break371_g80359 = Input_DirectionOS366_g80359;
				float3 appendResult372_g80359 = (float3(break371_g80359.x , ( Motion_SineA450_g80359 * 0.3 ) , break371_g80359.y));
				half3 Motion_20_Squash7632_g80308 = ( ( (max( Motion_SineA450_g80359 , Motion_SineB395_g80359 )*0.5 + 0.5) * Motion_Amplitude418_g80359 * Input_Squash58_g80359 * Input_MeshMotion_20388_g80359 * Input_BoundsRadius390_g80359 * Global_MotionValue462_g80359 ) * appendResult372_g80359 );
				half3 VertexPos40_g80321 = ( ( VertexPosRotationAxis50_g80334 + ( VertexPosOtherAxis82_g80334 * cos( Angle44_g80334 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g80334 ) * sin( Angle44_g80334 ) ) ) + Motion_20_Squash7632_g80308 );
				float3 appendResult74_g80321 = (float3(0.0 , VertexPos40_g80321.y , 0.0));
				float3 VertexPosRotationAxis50_g80321 = appendResult74_g80321;
				float3 break84_g80321 = VertexPos40_g80321;
				float3 appendResult81_g80321 = (float3(break84_g80321.x , 0.0 , break84_g80321.z));
				float3 VertexPosOtherAxis82_g80321 = appendResult81_g80321;
				half Input_Rolling379_g80359 = _MotionAmplitude_22;
				half Motion_20_Rolling7633_g80308 = ( Motion_SineA450_g80359 * Motion_Amplitude418_g80359 * Input_Rolling379_g80359 * Input_MeshMotion_20388_g80359 * Global_MotionValue462_g80359 );
				half Angle44_g80321 = Motion_20_Rolling7633_g80308;
				half3 Input_Position500_g80326 = WorldPosition3905_g80308;
				half Input_MotionScale321_g80326 = _MotionScale_32;
				half Input_MotionVariation330_g80326 = _MotionVariation_32;
				half Input_GlobalVariation372_g80326 = Global_MeshVariation7760_g80308;
				float lerpResult128_g80327 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g80326 = _MotionSpeed_32;
				float4 tex2DNode460_g80326 = SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( ( (Input_Position500_g80326).xz * Input_MotionScale321_g80326 * 0.03 ) + ( Input_MotionVariation330_g80326 * Input_GlobalVariation372_g80326 ) + ( lerpResult128_g80327 * Input_MotionSpeed62_g80326 * 0.02 ) ), 0.0 );
				float3 appendResult462_g80326 = (float3(tex2DNode460_g80326.r , tex2DNode460_g80326.g , tex2DNode460_g80326.b));
				half3 Flutter_Texture489_g80326 = (appendResult462_g80326*2.0 + -1.0);
				half Motion_30_Amplitude7534_g80308 = ( _MotionAmplitude_32 * Motion_FacingMask7691_g80308 );
				half Input_MotionAmplitude58_g80326 = Motion_30_Amplitude7534_g80308;
				float4 break33_g80369 = _motion_mask_mode_30;
				float temp_output_30_0_g80369 = ( v.ase_color.r * break33_g80369.x );
				float temp_output_29_0_g80369 = ( v.ase_color.g * break33_g80369.y );
				float temp_output_31_0_g80369 = ( v.ase_color.b * break33_g80369.z );
				float lerpResult7820_g80308 = lerp( v.ase_texcoord.y , ( temp_output_30_0_g80369 + temp_output_29_0_g80369 + temp_output_31_0_g80369 + ( v.ase_color.a * break33_g80369.w ) ) , saturate( _MotionMaskMode_30 ));
				half Mesh_Motion_30144_g80308 = lerpResult7820_g80308;
				half Input_MeshMotion_30374_g80326 = Mesh_Motion_30144_g80308;
				half Input_GlobalWind471_g80326 = Global_Wind_Power2223_g80308;
				half Global_MotionValue503_g80326 = TVE_MotionValue_30;
				half Input_GlobalNoise472_g80326 = Global_Noise_B5526_g80308;
				float lerpResult466_g80326 = lerp( 2.4 , 0.6 , Input_GlobalWind471_g80326);
				half Flutter_Amplitude491_g80326 = ( Input_MotionAmplitude58_g80326 * Input_MeshMotion_30374_g80326 * Input_GlobalWind471_g80326 * Global_MotionValue503_g80326 * pow( Input_GlobalNoise472_g80326 , lerpResult466_g80326 ) );
				half3 Motion_30_Flutter263_g80308 = ( Flutter_Texture489_g80326 * Flutter_Amplitude491_g80326 );
				float3 Vertex_Motion_Object7655_g80308 = ( ( ( VertexPosRotationAxis50_g80321 + ( VertexPosOtherAxis82_g80321 * cos( Angle44_g80321 ) ) + ( cross( float3(0,1,0) , VertexPosOtherAxis82_g80321 ) * sin( Angle44_g80321 ) ) ) + Motion_30_Flutter263_g80308 ) + Mesh_PivotsOS7730_g80308 );
				float3 Final_VertexPosition890_g80308 = Vertex_Motion_Object7655_g80308;
				
				float4 break33_g80365 = _second_uvs_mode;
				float2 temp_output_30_0_g80365 = ( v.ase_texcoord.xy * break33_g80365.x );
				float2 temp_output_29_0_g80365 = ( v.ase_texcoord3.xy * break33_g80365.y );
				float2 temp_output_31_0_g80365 = ( (WorldPosition3905_g80308).xz * break33_g80365.z );
				half2 Second_UVs_Tilling7781_g80308 = (_SecondUVs).xy;
				half2 Second_UVs_Scale7782_g80308 = ( 1.0 / Second_UVs_Tilling7781_g80308 );
				float2 lerpResult7786_g80308 = lerp( Second_UVs_Tilling7781_g80308 , Second_UVs_Scale7782_g80308 , _SecondUVsScaleMode);
				half2 Second_UVs_Offset7777_g80308 = (_SecondUVs).zw;
				float2 vertexToFrag11_g80309 = ( ( ( temp_output_30_0_g80365 + temp_output_29_0_g80365 + temp_output_31_0_g80365 ) * lerpResult7786_g80308 ) + Second_UVs_Offset7777_g80308 );
				o.ase_texcoord.zw = vertexToFrag11_g80309;
				float3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				o.ase_texcoord1.xyz = ase_worldTangent;
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				o.ase_texcoord2.xyz = ase_worldNormal;
				float ase_vertexTangentSign = v.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord3.xyz = ase_worldBitangent;
				
				o.ase_texcoord.xy = v.ase_texcoord.xy;
				o.ase_color = v.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord1.w = 0;
				o.ase_texcoord2.w = 0;
				o.ase_texcoord3.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = Final_VertexPosition890_g80308;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.positionOS.xyz = vertexValue;
				#else
					v.positionOS.xyz += vertexValue;
				#endif

				v.normalOS = v.normalOS;

				float3 positionWS = TransformObjectToWorld( v.positionOS.xyz );
				o.positionCS = TransformWorldToHClip(positionWS);

				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_tangent : TANGENT;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.positionOS;
				o.normalOS = v.normalOS;
				o.ase_color = v.ase_color;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_texcoord3 = v.ase_texcoord3;
				o.ase_tangent = v.ase_tangent;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.positionOS = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].vertex.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(VertexOutput IN ) : SV_TARGET
			{
				SurfaceDescription surfaceDescription = (SurfaceDescription)0;

				float localCustomAlphaClip19_g80314 = ( 0.0 );
				half2 Main_UVs15_g80308 = ( ( IN.ase_texcoord.xy * (_MainUVs).xy ) + (_MainUVs).zw );
				float4 tex2DNode29_g80308 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs15_g80308 );
				half Main_Alpha316_g80308 = tex2DNode29_g80308.a;
				float2 vertexToFrag11_g80309 = IN.ase_texcoord.zw;
				half2 Second_UVs17_g80308 = vertexToFrag11_g80309;
				float4 tex2DNode89_g80308 = SAMPLE_TEXTURE2D( _SecondAlbedoTex, sampler_SecondAlbedoTex, Second_UVs17_g80308 );
				half Second_Alpha5007_g80308 = tex2DNode89_g80308.a;
				float4 tex2DNode35_g80308 = SAMPLE_TEXTURE2D( _MainMaskTex, sampler_Linear_Repeat, Main_UVs15_g80308 );
				half Main_Mask57_g80308 = tex2DNode35_g80308.b;
				float4 tex2DNode33_g80308 = SAMPLE_TEXTURE2D( _SecondMaskTex, sampler_Linear_Repeat, Second_UVs17_g80308 );
				half Second_Mask81_g80308 = tex2DNode33_g80308.b;
				float lerpResult6885_g80308 = lerp( Main_Mask57_g80308 , Second_Mask81_g80308 , _DetailMaskMode);
				float clampResult17_g80325 = clamp( lerpResult6885_g80308 , 0.0001 , 0.9999 );
				float temp_output_7_0_g80324 = _DetailMaskMinValue;
				float temp_output_10_0_g80324 = ( _DetailMaskMaxValue - temp_output_7_0_g80324 );
				half Blend_Mask_Texture6794_g80308 = saturate( ( ( clampResult17_g80325 - temp_output_7_0_g80324 ) / ( temp_output_10_0_g80324 + 0.0001 ) ) );
				half4 Normal_Packed45_g80375 = SAMPLE_TEXTURE2D( _MainNormalTex, sampler_Linear_Repeat, Main_UVs15_g80308 );
				float2 appendResult58_g80375 = (float2(( (Normal_Packed45_g80375).x * (Normal_Packed45_g80375).w ) , (Normal_Packed45_g80375).y));
				half2 Normal_Default50_g80375 = appendResult58_g80375;
				half2 Normal_ASTC41_g80375 = (Normal_Packed45_g80375).xy;
				#ifdef UNITY_ASTC_NORMALMAP_ENCODING
				float2 staticSwitch38_g80375 = Normal_ASTC41_g80375;
				#else
				float2 staticSwitch38_g80375 = Normal_Default50_g80375;
				#endif
				half2 Normal_NO_DTX544_g80375 = (Normal_Packed45_g80375).wy;
				#ifdef UNITY_NO_DXT5nm
				float2 staticSwitch37_g80375 = Normal_NO_DTX544_g80375;
				#else
				float2 staticSwitch37_g80375 = staticSwitch38_g80375;
				#endif
				float2 temp_output_6555_0_g80308 = ( (staticSwitch37_g80375*2.0 + -1.0) * _MainNormalValue );
				float3 appendResult7388_g80308 = (float3(temp_output_6555_0_g80308 , 1.0));
				float3 ase_worldTangent = IN.ase_texcoord1.xyz;
				float3 ase_worldNormal = IN.ase_texcoord2.xyz;
				float3 ase_worldBitangent = IN.ase_texcoord3.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 tanNormal7389_g80308 = appendResult7388_g80308;
				float3 worldNormal7389_g80308 = float3(dot(tanToWorld0,tanNormal7389_g80308), dot(tanToWorld1,tanNormal7389_g80308), dot(tanToWorld2,tanNormal7389_g80308));
				half3 Main_NormalWS7390_g80308 = worldNormal7389_g80308;
				float4 break33_g80385 = _detail_mesh_mode;
				float temp_output_30_0_g80385 = ( IN.ase_color.r * break33_g80385.x );
				float temp_output_29_0_g80385 = ( IN.ase_color.g * break33_g80385.y );
				float temp_output_31_0_g80385 = ( IN.ase_color.b * break33_g80385.z );
				float lerpResult7836_g80308 = lerp( ((Main_NormalWS7390_g80308).y*0.5 + 0.5) , ( temp_output_30_0_g80385 + temp_output_29_0_g80385 + temp_output_31_0_g80385 + ( IN.ase_color.a * break33_g80385.w ) ) , saturate( _DetailMeshMode ));
				float clampResult17_g80323 = clamp( lerpResult7836_g80308 , 0.0001 , 0.9999 );
				float temp_output_7_0_g80322 = _DetailMeshMinValue;
				float temp_output_10_0_g80322 = ( _DetailMeshMaxValue - temp_output_7_0_g80322 );
				half Blend_Mask_Mesh1540_g80308 = saturate( ( ( clampResult17_g80323 - temp_output_7_0_g80322 ) / ( temp_output_10_0_g80322 + 0.0001 ) ) );
				float clampResult17_g80352 = clamp( ( Blend_Mask_Texture6794_g80308 * Blend_Mask_Mesh1540_g80308 ) , 0.0001 , 0.9999 );
				float temp_output_7_0_g80353 = _DetailBlendMinValue;
				float temp_output_10_0_g80353 = ( _DetailBlendMaxValue - temp_output_7_0_g80353 );
				half Blend_Mask147_g80308 = ( saturate( ( ( clampResult17_g80352 - temp_output_7_0_g80353 ) / ( temp_output_10_0_g80353 + 0.0001 ) ) ) * _DetailMode * _DetailValue );
				float lerpResult6153_g80308 = lerp( Main_Alpha316_g80308 , Second_Alpha5007_g80308 , Blend_Mask147_g80308);
				float lerpResult6785_g80308 = lerp( ( Main_Alpha316_g80308 * Second_Alpha5007_g80308 ) , lerpResult6153_g80308 , _DetailAlphaMode);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch6158_g80308 = lerpResult6785_g80308;
				#else
				float staticSwitch6158_g80308 = Main_Alpha316_g80308;
				#endif
				half Blend_Alpha6157_g80308 = staticSwitch6158_g80308;
				half AlphaTreshold2132_g80308 = _AlphaClipValue;
				float temp_output_3_0_g80314 = ( Blend_Alpha6157_g80308 - AlphaTreshold2132_g80308 );
				float Alpha19_g80314 = temp_output_3_0_g80314;
				float temp_output_15_0_g80314 = 0.01;
				float Treshold19_g80314 = temp_output_15_0_g80314;
				{
				#if defined (TVE_FEATURE_CLIP)
				#if defined (TVE_IS_HD_PIPELINE)
				#if !defined(SHADERPASS_FORWARD_BYPASS_ALPHA_TEST) && !defined(SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST)
				clip(Alpha19_g80314 - Treshold19_g80314);
				#endif
				#else
				clip(Alpha19_g80314 - Treshold19_g80314);
				#endif
				#endif
				}
				half Final_Clip914_g80308 = Alpha19_g80314;
				

				surfaceDescription.Alpha = Final_Clip914_g80308;
				surfaceDescription.AlphaClipThreshold = 0.5;

				#if _ALPHATEST_ON
					float alphaClipThreshold = 0.01f;
					#if ALPHA_CLIP_THRESHOLD
						alphaClipThreshold = surfaceDescription.AlphaClipThreshold;
					#endif
						clip(surfaceDescription.Alpha - alphaClipThreshold);
				#endif

				half4 outColor = 0;

				#ifdef SCENESELECTIONPASS
					outColor = half4(_ObjectId, _PassValue, 1.0, 1.0);
				#elif defined(SCENEPICKINGPASS)
					outColor = _SelectionID;
				#endif

				return outColor;
			}

			ENDHLSL
		}
		
	}
	
	CustomEditor "TVEShaderLiteGUI"
	FallBack "Hidden/Shader Graph/FallbackError"
	
	Fallback "Hidden/Shader Graph/FallbackError"
}
/*ASEBEGIN
Version=19202
Node;AmplifyShaderEditor.RangedFloatNode;10;-2176,-768;Half;False;Property;_render_cull;_render_cull;179;1;[HideInInspector];Create;True;0;3;Both;0;Back;1;Front;2;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;20;-1984,-768;Half;False;Property;_render_src;_render_src;180;1;[HideInInspector];Create;True;0;0;0;True;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;7;-1792,-768;Half;False;Property;_render_dst;_render_dst;181;1;[HideInInspector];Create;True;0;2;Opaque;0;Transparent;1;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;17;-1600,-768;Half;False;Property;_render_zw;_render_zw;182;1;[HideInInspector];Create;True;0;2;Opaque;0;Transparent;1;0;True;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;33;-2176,-512;Inherit;False;1280.896;100;Final;0;;0,1,0.5,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;37;-2176,-896;Inherit;False;1280.438;100;Internal;0;;1,0.252,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;285;-2176,384;Inherit;False;1280.438;100;Features;0;;0,1,0.5,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;848;-1408,-768;Half;False;Property;_render_coverage;_render_coverage;183;1;[HideInInspector];Create;True;0;2;Opaque;0;Transparent;1;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;373;-1088,512;Inherit;False;Compile All Shaders;-1;;79783;e67c8238031dbf04ab79a5d4d63d1b4f;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;854;-1280,512;Inherit;False;Compile Lite;-1;;80227;e24430099ff589f45be1dd88516fd075;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;862;-1664,512;Inherit;False;Define ShaderType Plant;186;;80307;b458122dd75182d488380bd0f592b9e6;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;861;-2176,-384;Inherit;False;Base Shader Lite;0;;80308;1f5c35e7b395a0a498f1140933e5e744;36,3880,1,4179,1,6791,1,1298,1,1300,1,6792,1,7741,1,6116,1,7558,1,1718,1,1715,1,1717,1,6729,1,1776,0,7611,1,3501,1,2807,1,6206,1,6320,1,6848,1,4837,1,1734,1,1737,1,6622,1,6161,1,6166,1,1735,1,1736,1,7560,1,7660,1,7656,1,7653,1,7652,1,7693,1,7737,0,5090,0;2;6205;FLOAT;1;False;6198;FLOAT;1;False;18;FLOAT3;0;FLOAT3;528;FLOAT3;2489;FLOAT;531;FLOAT;4842;FLOAT;529;FLOAT;3678;FLOAT;530;FLOAT;1235;FLOAT;532;FLOAT;5389;FLOAT;721;FLOAT3;1230;FLOAT;5296;FLOAT;1461;FLOAT;1290;FLOAT;4867;FLOAT3;534
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;863;-1152,-384;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;ExtraPrePass;0;0;ExtraPrePass;5;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;3;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;0;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;864;-1152,-384;Float;False;True;-1;2;TVEShaderLiteGUI;0;15;BOXOPHOBIC/The Vegetation Engine Lite/Geometry/Plant Standard Lit;28cd5599e02859647ae1798e4fcaef6c;True;Forward;0;1;Forward;21;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;True;True;2;True;_render_cull;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;True;True;1;True;_render_zw;True;3;False;;True;False;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;True;True;1;1;True;_render_src;0;True;_render_dst;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalForward;False;False;0;Hidden/Shader Graph/FallbackError;0;0;Standard;40;Workflow;0;638299555939056898;Surface;0;0;  Refraction Model;0;0;  Blend;0;0;Two Sided;0;638299555954494050;Fragment Normal Space,InvertActionOnDeselection;0;0;Forward Only;0;0;Transmission;0;0;  Transmission Shadow;0.5,True,;0;Translucency;0;0;  Translucency Strength;1,False,;0;  Normal Distortion;0.5,False,;0;  Scattering;2,False,;0;  Direct;0.9,False,;0;  Ambient;0.1,False,;0;  Shadow;0.5,False,;0;Cast Shadows;1;0;  Use Shadow Threshold;0;0;GPU Instancing;1;0;LOD CrossFade;1;0;Built-in Fog;1;0;_FinalColorxAlpha;0;0;Meta Pass;1;0;Override Baked GI;0;0;Extra Pre Pass;0;0;DOTS Instancing;1;638299556015490611;Tessellation;0;0;  Phong;0;0;  Strength;0.5,False,;0;  Type;0;0;  Tess;16,False,;0;  Min;10,False,;0;  Max;25,False,;0;  Edge Length;16,False,;0;  Max Displacement;25,False,;0;Write Depth;0;0;  Early Z;0;0;Vertex Position,InvertActionOnDeselection;0;638299556041457638;Debug Display;0;0;Clear Coat;0;0;0;10;False;True;True;True;True;True;True;True;True;True;False;;True;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;865;-1152,-384;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;3;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=ShadowCaster;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;866;-1152,-384;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;DepthOnly;0;3;DepthOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;3;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;False;False;True;1;LightMode=DepthOnly;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;867;-1152,-384;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;Meta;0;4;Meta;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;3;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;868;-1152,-384;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;Universal2D;0;5;Universal2D;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;3;True;12;all;0;False;True;1;1;True;_render_src;0;True;_render_dst;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=Universal2D;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;869;-1152,-384;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;DepthNormals;0;6;DepthNormals;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;3;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=DepthNormals;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;870;-1152,-384;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;GBuffer;0;7;GBuffer;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;3;True;12;all;0;False;True;1;1;True;_render_src;0;True;_render_dst;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalGBuffer;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;871;-1152,-384;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;SceneSelectionPass;0;8;SceneSelectionPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;3;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=SceneSelectionPass;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;872;-1152,-384;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;ScenePickingPass;0;9;ScenePickingPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;3;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Picking;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.FunctionNode;873;-1920,512;Inherit;False;Define Lighting Standard;184;;80387;116a5c57ec750cb4896f729a6748c509;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;874;-2176,512;Inherit;False;Define Pipeline Universal;-1;;80388;71dc7add32e5f6247b1fb74ecceddd3e;0;0;1;FLOAT;529
WireConnection;864;0;861;0
WireConnection;864;1;861;528
WireConnection;864;2;861;2489
WireConnection;864;9;861;3678
WireConnection;864;4;861;530
WireConnection;864;5;861;531
WireConnection;864;6;861;532
WireConnection;864;8;861;534
ASEEND*/
//CHKSM=C960165ABAE7BD2CFF1E97C3DDCAEAF7579DF607