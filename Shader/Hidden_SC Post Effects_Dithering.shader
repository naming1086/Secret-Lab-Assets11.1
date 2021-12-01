//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/SC Post Effects/Dithering" {
Properties {
}
SubShader {
 Pass {
  Name "Dithering"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 23209
Program "vp" {
SubProgram "d3d11 " {
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	float _RenderViewportScaleFactor;
in  vec3 in_POSITION0;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
vec2 u_xlat0;
void main()
{
    gl_Position.xy = in_POSITION0.xy;
    gl_Position.zw = vec2(0.0, 1.0);
    u_xlat0.xy = in_POSITION0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    vs_TEXCOORD1.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    vs_TEXCOORD0.xy = in_POSITION0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ScreenParams;
uniform 	vec4 _Dithering_Coords;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _LUT;
in  vec2 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
bvec3 u_xlatb3;
vec3 u_xlat4;
float u_xlat12;
void main()
{
    u_xlat0.x = _ScreenParams.x / _ScreenParams.y;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD0.x;
    u_xlat0.y = vs_TEXCOORD0.y * _ScreenParams.w;
    u_xlat0.xy = u_xlat0.xy * _Dithering_Coords.yy;
    u_xlat0.xy = u_xlat0.xy * vec2(32.0, 32.0);
    u_xlat0 = texture(_LUT, u_xlat0.xy);
    u_xlat1 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat4.xyz = max(abs(u_xlat1.xyz), vec3(1.1920929e-07, 1.1920929e-07, 1.1920929e-07));
    u_xlat4.xyz = log2(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat4.xyz = exp2(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat2.xyz = u_xlat1.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb3.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat1.xyzx).xyz;
    {
        vec3 hlslcc_movcTemp = u_xlat4;
        hlslcc_movcTemp.x = (u_xlatb3.x) ? u_xlat2.x : u_xlat4.x;
        hlslcc_movcTemp.y = (u_xlatb3.y) ? u_xlat2.y : u_xlat4.y;
        hlslcc_movcTemp.z = (u_xlatb3.z) ? u_xlat2.z : u_xlat4.z;
        u_xlat4 = hlslcc_movcTemp;
    }
    u_xlat4.x = dot(u_xlat4.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat4.x = u_xlat4.x / _Dithering_Coords.z;
    u_xlatb0 = u_xlat4.x>=u_xlat0.x;
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat0.xyz = u_xlat1.xyz * u_xlat0.xxx + (-u_xlat1.xyz);
    u_xlat12 = _Dithering_Coords.w * _Dithering_Coords.w;
    SV_Target0.xyz = u_xlat0.xyz * vec3(u_xlat12) + u_xlat1.xyz;
    SV_Target0.w = u_xlat1.w;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 67
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Vertex %4 "main" %13 %18 %45 %55 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpMemberDecorate %11 0 BuiltIn TessLevelOuter 
                                             OpMemberDecorate %11 1 BuiltIn TessLevelOuter 
                                             OpMemberDecorate %11 2 BuiltIn TessLevelOuter 
                                             OpDecorate %11 Block 
                                             OpDecorate %18 Location 18 
                                             OpDecorate vs_TEXCOORD1 Location 45 
                                             OpMemberDecorate %47 0 Offset 47 
                                             OpDecorate %47 Block 
                                             OpDecorate %49 DescriptorSet 49 
                                             OpDecorate %49 Binding 49 
                                             OpDecorate vs_TEXCOORD0 Location 55 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypeInt 32 0 
                                  u32 %9 = OpConstant 1 
                                     %10 = OpTypeArray %6 %9 
                                     %11 = OpTypeStruct %7 %6 %10 
                                     %12 = OpTypePointer Output %11 
Output struct {f32_4; f32; f32[1];}* %13 = OpVariable Output 
                                     %14 = OpTypeInt 32 1 
                                 i32 %15 = OpConstant 0 
                                     %16 = OpTypeVector %6 3 
                                     %17 = OpTypePointer Input %16 
                        Input f32_3* %18 = OpVariable Input 
                                     %19 = OpTypeVector %6 2 
                                     %22 = OpTypePointer Output %7 
                                 f32 %26 = OpConstant 3.674022E-40 
                                 f32 %27 = OpConstant 3.674022E-40 
                               f32_2 %28 = OpConstantComposite %26 %27 
                                     %32 = OpTypePointer Private %19 
                      Private f32_2* %33 = OpVariable Private 
                               f32_2 %36 = OpConstantComposite %27 %27 
                                 f32 %39 = OpConstant 3.674022E-40 
                                 f32 %40 = OpConstant 3.674022E-40 
                               f32_2 %41 = OpConstantComposite %39 %40 
                                     %44 = OpTypePointer Output %19 
              Output f32_2* vs_TEXCOORD1 = OpVariable Output 
                                     %47 = OpTypeStruct %6 
                                     %48 = OpTypePointer Uniform %47 
              Uniform struct {f32;}* %49 = OpVariable Uniform 
                                     %50 = OpTypePointer Uniform %6 
              Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                               f32_2 %59 = OpConstantComposite %39 %39 
                                     %61 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                               f32_3 %20 = OpLoad %18 
                               f32_2 %21 = OpVectorShuffle %20 %20 0 1 
                       Output f32_4* %23 = OpAccessChain %13 %15 
                               f32_4 %24 = OpLoad %23 
                               f32_4 %25 = OpVectorShuffle %24 %21 4 5 2 3 
                                             OpStore %23 %25 
                       Output f32_4* %29 = OpAccessChain %13 %15 
                               f32_4 %30 = OpLoad %29 
                               f32_4 %31 = OpVectorShuffle %30 %28 0 1 4 5 
                                             OpStore %29 %31 
                               f32_3 %34 = OpLoad %18 
                               f32_2 %35 = OpVectorShuffle %34 %34 0 1 
                               f32_2 %37 = OpFAdd %35 %36 
                                             OpStore %33 %37 
                               f32_2 %38 = OpLoad %33 
                               f32_2 %42 = OpFMul %38 %41 
                               f32_2 %43 = OpFAdd %42 %28 
                                             OpStore %33 %43 
                               f32_2 %46 = OpLoad %33 
                        Uniform f32* %51 = OpAccessChain %49 %15 
                                 f32 %52 = OpLoad %51 
                               f32_2 %53 = OpCompositeConstruct %52 %52 
                               f32_2 %54 = OpFMul %46 %53 
                                             OpStore vs_TEXCOORD1 %54 
                               f32_3 %56 = OpLoad %18 
                               f32_2 %57 = OpVectorShuffle %56 %56 0 1 
                               f32_2 %58 = OpFMul %57 %41 
                               f32_2 %60 = OpFAdd %58 %59 
                                             OpStore vs_TEXCOORD0 %60 
                         Output f32* %62 = OpAccessChain %13 %15 %9 
                                 f32 %63 = OpLoad %62 
                                 f32 %64 = OpFNegate %63 
                         Output f32* %65 = OpAccessChain %13 %15 %9 
                                             OpStore %65 %64 
                                             OpReturn
                                             OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 223
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %31 %83 %208 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpMemberDecorate %11 0 Offset 11 
                                             OpMemberDecorate %11 1 Offset 11 
                                             OpDecorate %11 Block 
                                             OpDecorate %13 DescriptorSet 13 
                                             OpDecorate %13 Binding 13 
                                             OpDecorate vs_TEXCOORD0 Location 31 
                                             OpDecorate %63 DescriptorSet 63 
                                             OpDecorate %63 Binding 63 
                                             OpDecorate %67 DescriptorSet 67 
                                             OpDecorate %67 Binding 67 
                                             OpDecorate %78 DescriptorSet 78 
                                             OpDecorate %78 Binding 78 
                                             OpDecorate %80 DescriptorSet 80 
                                             OpDecorate %80 Binding 80 
                                             OpDecorate vs_TEXCOORD1 Location 83 
                                             OpDecorate %208 Location 208 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 3 
                                      %8 = OpTypePointer Private %7 
                       Private f32_3* %9 = OpVariable Private 
                                     %10 = OpTypeVector %6 4 
                                     %11 = OpTypeStruct %10 %10 
                                     %12 = OpTypePointer Uniform %11 
     Uniform struct {f32_4; f32_4;}* %13 = OpVariable Uniform 
                                     %14 = OpTypeInt 32 1 
                                 i32 %15 = OpConstant 0 
                                     %16 = OpTypeInt 32 0 
                                 u32 %17 = OpConstant 0 
                                     %18 = OpTypePointer Uniform %6 
                                 u32 %21 = OpConstant 1 
                                     %25 = OpTypePointer Private %6 
                                     %29 = OpTypeVector %6 2 
                                     %30 = OpTypePointer Input %29 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                     %32 = OpTypePointer Input %6 
                                 u32 %39 = OpConstant 3 
                                 i32 %46 = OpConstant 1 
                                     %47 = OpTypePointer Uniform %10 
                                 f32 %56 = OpConstant 3.674022E-40 
                               f32_2 %57 = OpConstantComposite %56 %56 
                                     %61 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %62 = OpTypePointer UniformConstant %61 
UniformConstant read_only Texture2D* %63 = OpVariable UniformConstant 
                                     %65 = OpTypeSampler 
                                     %66 = OpTypePointer UniformConstant %65 
            UniformConstant sampler* %67 = OpVariable UniformConstant 
                                     %69 = OpTypeSampledImage %61 
                                     %76 = OpTypePointer Private %10 
                      Private f32_4* %77 = OpVariable Private 
UniformConstant read_only Texture2D* %78 = OpVariable UniformConstant 
            UniformConstant sampler* %80 = OpVariable UniformConstant 
               Input f32_2* vs_TEXCOORD1 = OpVariable Input 
                      Private f32_3* %86 = OpVariable Private 
                                 f32 %90 = OpConstant 3.674022E-40 
                               f32_3 %91 = OpConstantComposite %90 %90 %90 
                                 f32 %96 = OpConstant 3.674022E-40 
                               f32_3 %97 = OpConstantComposite %96 %96 %96 
                                f32 %102 = OpConstant 3.674022E-40 
                              f32_3 %103 = OpConstantComposite %102 %102 %102 
                                f32 %105 = OpConstant 3.674022E-40 
                              f32_3 %106 = OpConstantComposite %105 %105 %105 
                     Private f32_3* %108 = OpVariable Private 
                                f32 %111 = OpConstant 3.674022E-40 
                              f32_3 %112 = OpConstantComposite %111 %111 %111 
                                    %114 = OpTypeBool 
                                    %115 = OpTypeVector %114 3 
                                    %116 = OpTypePointer Private %115 
                    Private bool_3* %117 = OpVariable Private 
                                f32 %118 = OpConstant 3.674022E-40 
                                f32 %119 = OpConstant 3.674022E-40 
                              f32_4 %120 = OpConstantComposite %118 %118 %118 %119 
                                    %123 = OpTypeVector %114 4 
                                    %126 = OpTypePointer Function %7 
                                    %129 = OpTypePointer Private %114 
                                    %132 = OpTypePointer Function %6 
                                u32 %155 = OpConstant 2 
                                f32 %170 = OpConstant 3.674022E-40 
                                f32 %171 = OpConstant 3.674022E-40 
                                f32 %172 = OpConstant 3.674022E-40 
                              f32_3 %173 = OpConstantComposite %170 %171 %172 
                      Private bool* %182 = OpVariable Private 
                                f32 %189 = OpConstant 3.674022E-40 
                       Private f32* %201 = OpVariable Private 
                                    %207 = OpTypePointer Output %10 
                      Output f32_4* %208 = OpVariable Output 
                                    %220 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                    Function f32_3* %127 = OpVariable Function 
                      Function f32* %133 = OpVariable Function 
                      Function f32* %145 = OpVariable Function 
                      Function f32* %158 = OpVariable Function 
                        Uniform f32* %19 = OpAccessChain %13 %15 %17 
                                 f32 %20 = OpLoad %19 
                        Uniform f32* %22 = OpAccessChain %13 %15 %21 
                                 f32 %23 = OpLoad %22 
                                 f32 %24 = OpFDiv %20 %23 
                        Private f32* %26 = OpAccessChain %9 %17 
                                             OpStore %26 %24 
                        Private f32* %27 = OpAccessChain %9 %17 
                                 f32 %28 = OpLoad %27 
                          Input f32* %33 = OpAccessChain vs_TEXCOORD0 %17 
                                 f32 %34 = OpLoad %33 
                                 f32 %35 = OpFMul %28 %34 
                        Private f32* %36 = OpAccessChain %9 %17 
                                             OpStore %36 %35 
                          Input f32* %37 = OpAccessChain vs_TEXCOORD0 %21 
                                 f32 %38 = OpLoad %37 
                        Uniform f32* %40 = OpAccessChain %13 %15 %39 
                                 f32 %41 = OpLoad %40 
                                 f32 %42 = OpFMul %38 %41 
                        Private f32* %43 = OpAccessChain %9 %21 
                                             OpStore %43 %42 
                               f32_3 %44 = OpLoad %9 
                               f32_2 %45 = OpVectorShuffle %44 %44 0 1 
                      Uniform f32_4* %48 = OpAccessChain %13 %46 
                               f32_4 %49 = OpLoad %48 
                               f32_2 %50 = OpVectorShuffle %49 %49 1 1 
                               f32_2 %51 = OpFMul %45 %50 
                               f32_3 %52 = OpLoad %9 
                               f32_3 %53 = OpVectorShuffle %52 %51 3 4 2 
                                             OpStore %9 %53 
                               f32_3 %54 = OpLoad %9 
                               f32_2 %55 = OpVectorShuffle %54 %54 0 1 
                               f32_2 %58 = OpFMul %55 %57 
                               f32_3 %59 = OpLoad %9 
                               f32_3 %60 = OpVectorShuffle %59 %58 3 4 2 
                                             OpStore %9 %60 
                 read_only Texture2D %64 = OpLoad %63 
                             sampler %68 = OpLoad %67 
          read_only Texture2DSampled %70 = OpSampledImage %64 %68 
                               f32_3 %71 = OpLoad %9 
                               f32_2 %72 = OpVectorShuffle %71 %71 0 1 
                               f32_4 %73 = OpImageSampleImplicitLod %70 %72 
                                 f32 %74 = OpCompositeExtract %73 0 
                        Private f32* %75 = OpAccessChain %9 %17 
                                             OpStore %75 %74 
                 read_only Texture2D %79 = OpLoad %78 
                             sampler %81 = OpLoad %80 
          read_only Texture2DSampled %82 = OpSampledImage %79 %81 
                               f32_2 %84 = OpLoad vs_TEXCOORD1 
                               f32_4 %85 = OpImageSampleImplicitLod %82 %84 
                                             OpStore %77 %85 
                               f32_4 %87 = OpLoad %77 
                               f32_3 %88 = OpVectorShuffle %87 %87 0 1 2 
                               f32_3 %89 = OpExtInst %1 4 %88 
                               f32_3 %92 = OpExtInst %1 40 %89 %91 
                                             OpStore %86 %92 
                               f32_3 %93 = OpLoad %86 
                               f32_3 %94 = OpExtInst %1 30 %93 
                                             OpStore %86 %94 
                               f32_3 %95 = OpLoad %86 
                               f32_3 %98 = OpFMul %95 %97 
                                             OpStore %86 %98 
                               f32_3 %99 = OpLoad %86 
                              f32_3 %100 = OpExtInst %1 29 %99 
                                             OpStore %86 %100 
                              f32_3 %101 = OpLoad %86 
                              f32_3 %104 = OpFMul %101 %103 
                              f32_3 %107 = OpFAdd %104 %106 
                                             OpStore %86 %107 
                              f32_4 %109 = OpLoad %77 
                              f32_3 %110 = OpVectorShuffle %109 %109 0 1 2 
                              f32_3 %113 = OpFMul %110 %112 
                                             OpStore %108 %113 
                              f32_4 %121 = OpLoad %77 
                              f32_4 %122 = OpVectorShuffle %121 %121 0 1 2 0 
                             bool_4 %124 = OpFOrdGreaterThanEqual %120 %122 
                             bool_3 %125 = OpVectorShuffle %124 %124 0 1 2 
                                             OpStore %117 %125 
                              f32_3 %128 = OpLoad %86 
                                             OpStore %127 %128 
                      Private bool* %130 = OpAccessChain %117 %17 
                               bool %131 = OpLoad %130 
                                             OpSelectionMerge %135 None 
                                             OpBranchConditional %131 %134 %138 
                                    %134 = OpLabel 
                       Private f32* %136 = OpAccessChain %108 %17 
                                f32 %137 = OpLoad %136 
                                             OpStore %133 %137 
                                             OpBranch %135 
                                    %138 = OpLabel 
                       Private f32* %139 = OpAccessChain %86 %17 
                                f32 %140 = OpLoad %139 
                                             OpStore %133 %140 
                                             OpBranch %135 
                                    %135 = OpLabel 
                                f32 %141 = OpLoad %133 
                      Function f32* %142 = OpAccessChain %127 %17 
                                             OpStore %142 %141 
                      Private bool* %143 = OpAccessChain %117 %21 
                               bool %144 = OpLoad %143 
                                             OpSelectionMerge %147 None 
                                             OpBranchConditional %144 %146 %150 
                                    %146 = OpLabel 
                       Private f32* %148 = OpAccessChain %108 %21 
                                f32 %149 = OpLoad %148 
                                             OpStore %145 %149 
                                             OpBranch %147 
                                    %150 = OpLabel 
                       Private f32* %151 = OpAccessChain %86 %21 
                                f32 %152 = OpLoad %151 
                                             OpStore %145 %152 
                                             OpBranch %147 
                                    %147 = OpLabel 
                                f32 %153 = OpLoad %145 
                      Function f32* %154 = OpAccessChain %127 %21 
                                             OpStore %154 %153 
                      Private bool* %156 = OpAccessChain %117 %155 
                               bool %157 = OpLoad %156 
                                             OpSelectionMerge %160 None 
                                             OpBranchConditional %157 %159 %163 
                                    %159 = OpLabel 
                       Private f32* %161 = OpAccessChain %108 %155 
                                f32 %162 = OpLoad %161 
                                             OpStore %158 %162 
                                             OpBranch %160 
                                    %163 = OpLabel 
                       Private f32* %164 = OpAccessChain %86 %155 
                                f32 %165 = OpLoad %164 
                                             OpStore %158 %165 
                                             OpBranch %160 
                                    %160 = OpLabel 
                                f32 %166 = OpLoad %158 
                      Function f32* %167 = OpAccessChain %127 %155 
                                             OpStore %167 %166 
                              f32_3 %168 = OpLoad %127 
                                             OpStore %86 %168 
                              f32_3 %169 = OpLoad %86 
                                f32 %174 = OpDot %169 %173 
                       Private f32* %175 = OpAccessChain %86 %17 
                                             OpStore %175 %174 
                       Private f32* %176 = OpAccessChain %86 %17 
                                f32 %177 = OpLoad %176 
                       Uniform f32* %178 = OpAccessChain %13 %46 %155 
                                f32 %179 = OpLoad %178 
                                f32 %180 = OpFDiv %177 %179 
                       Private f32* %181 = OpAccessChain %86 %17 
                                             OpStore %181 %180 
                       Private f32* %183 = OpAccessChain %86 %17 
                                f32 %184 = OpLoad %183 
                       Private f32* %185 = OpAccessChain %9 %17 
                                f32 %186 = OpLoad %185 
                               bool %187 = OpFOrdGreaterThanEqual %184 %186 
                                             OpStore %182 %187 
                               bool %188 = OpLoad %182 
                                f32 %190 = OpSelect %188 %189 %119 
                       Private f32* %191 = OpAccessChain %9 %17 
                                             OpStore %191 %190 
                              f32_4 %192 = OpLoad %77 
                              f32_3 %193 = OpVectorShuffle %192 %192 0 1 2 
                              f32_3 %194 = OpLoad %9 
                              f32_3 %195 = OpVectorShuffle %194 %194 0 0 0 
                              f32_3 %196 = OpFMul %193 %195 
                              f32_4 %197 = OpLoad %77 
                              f32_3 %198 = OpVectorShuffle %197 %197 0 1 2 
                              f32_3 %199 = OpFNegate %198 
                              f32_3 %200 = OpFAdd %196 %199 
                                             OpStore %9 %200 
                       Uniform f32* %202 = OpAccessChain %13 %46 %39 
                                f32 %203 = OpLoad %202 
                       Uniform f32* %204 = OpAccessChain %13 %46 %39 
                                f32 %205 = OpLoad %204 
                                f32 %206 = OpFMul %203 %205 
                                             OpStore %201 %206 
                              f32_3 %209 = OpLoad %9 
                                f32 %210 = OpLoad %201 
                              f32_3 %211 = OpCompositeConstruct %210 %210 %210 
                              f32_3 %212 = OpFMul %209 %211 
                              f32_4 %213 = OpLoad %77 
                              f32_3 %214 = OpVectorShuffle %213 %213 0 1 2 
                              f32_3 %215 = OpFAdd %212 %214 
                              f32_4 %216 = OpLoad %208 
                              f32_4 %217 = OpVectorShuffle %216 %215 4 5 6 3 
                                             OpStore %208 %217 
                       Private f32* %218 = OpAccessChain %77 %39 
                                f32 %219 = OpLoad %218 
                        Output f32* %221 = OpAccessChain %208 %39 
                                             OpStore %221 %219 
                                             OpReturn
                                             OpFunctionEnd
"
}
}
Program "fp" {
SubProgram "d3d11 " {
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
""
}
SubProgram "vulkan " {
""
}
}
}
}
}